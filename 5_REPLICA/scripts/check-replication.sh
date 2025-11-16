#!/usr/bin/env bash
set -euo pipefail

COMPOSE_CLI=${COMPOSE_CLI:-"docker compose"}
IFS=' ' read -r -a COMPOSE_CMD <<< "$COMPOSE_CLI"
TARGET_PK_VALUE=${TARGET_PK_VALUE:-1}

run_psql() {
  local service=$1
  shift
  "${COMPOSE_CMD[@]}" exec -T "$service" psql -U canteen -d canteen "$@"
}

fetch_value() {
  local service=$1
  run_psql "$service" -tAc "SELECT price::text FROM canteendishes WHERE dishid=${TARGET_PK_VALUE};" | tr -d '\n\r'
}

echo "--- Первичный сервер: pg_stat_replication ---"
run_psql postgres-primary -c "SELECT pid, application_name, state, sync_state, write_lsn, flush_lsn, replay_lsn FROM pg_stat_replication;"

echo
echo "--- Реплика: pg_is_in_recovery() ---"
run_psql postgres-replica -c "SELECT pg_is_in_recovery();"

echo
echo "--- Проверка данных (canteendishes.price при dishid=${TARGET_PK_VALUE}) ---"
primary_before=$(fetch_value postgres-primary)
replica_before=$(fetch_value postgres-replica)
echo "Первичный сервер до обновления : ${primary_before}"
echo "Сервер-реплика до обновления : ${replica_before}"

if [ "$primary_before" != "$replica_before" ]; then
  echo "[ПРЕДУПРЕЖДЕНИЕ] Значения отличаются до обновления; репликация не синхронизирована." >&2
else
  echo "Значения совпадают до обновления."
fi

echo
echo "--- Применяем изменение на первичном сервере ---"
update_output=$(run_psql postgres-primary -tAc "UPDATE canteendishes SET price = price + 1 WHERE dishid=${TARGET_PK_VALUE} RETURNING price::text;")
updated_value=$(echo "$update_output" | head -n 1 | tr -d '\n\r')
rows_changed=$(echo "$update_output" | tail -n 1 | tr -d '\n\r')
changed_count=$(echo "$rows_changed" | awk '{print $NF}')
echo "Новое значение на первичном сервере: ${updated_value}"
echo "Изменено строк: ${changed_count}"

sleep 2

primary_after=$(fetch_value postgres-primary)
replica_after=$(fetch_value postgres-replica)

echo
echo "--- Значения после репликации ---"
echo "Первичный сервер после обновления : ${primary_after}"
echo "Сервер-реплика после обновления : ${replica_after}"

if [ "$primary_after" = "$replica_after" ]; then
  echo "Репликация подтверждена для выбранной строки."
else
  echo "[ПРЕДУПРЕЖДЕНИЕ] Реплика еще не обновилась. Попробуйте увеличить задержку." >&2
fi

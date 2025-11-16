#!/usr/bin/env bash
set -euo pipefail

COMPOSE_FILE=${COMPOSE_FILE:-"citus_cluster/docker-compose.yml"}
COMPOSE_CMD=(docker compose -f "$COMPOSE_FILE")
CITUS_DB=${CITUS_DB:-canteen}
CITUS_USER=${CITUS_USER:-postgres}

run_psql() {
  local service=$1
  shift
  "${COMPOSE_CMD[@]}" exec -T "$service" psql -U "$CITUS_USER" -d "$CITUS_DB" "$@"
}

wait_for_personcanteenorder() {
  while true; do
    if result=$(run_psql citus-coordinator -tAc "SELECT to_regclass('personcanteenorder');" 2>/dev/null); then
      val=$(echo "$result" | tr -d '[:space:]')
      if [ "$val" = "personcanteenorder" ]; then
        break
      fi
    fi
    echo "Ожидаем создание таблицы personcanteenorder..."
    sleep 2
  done
}

wait_for_personcanteenorder

echo "--- Проверяем состояние шардов personcanteenorder ---"
run_psql citus-coordinator -c "SELECT sp.shardid, sp.nodename, sp.nodeport, s.shardminvalue, s.shardmaxvalue FROM pg_dist_shard_placement sp JOIN pg_dist_shard s USING (shardid) WHERE s.logicalrelid='personcanteenorder'::regclass ORDER BY sp.shardid, sp.nodename;"

ts=$(date +%s)
personid_a=$ts
personid_b=$((ts + 1))

echo
echo "Добавляем тестовые personid=${personid_a} и personid=${personid_b}."

echo "--- Добавляем записи через координатор ---"
run_psql citus-coordinator -c "INSERT INTO personcanteenorder(personid, dateorder, dishid) VALUES (${personid_a}, CURRENT_DATE, 1);"
run_psql citus-coordinator -c "INSERT INTO personcanteenorder(personid, dateorder, dishid) VALUES (${personid_b}, CURRENT_DATE, 2);"

sleep 2

get_shard_id() {
  local personid=$1
  run_psql citus-coordinator -tAc "SELECT get_shard_id_for_distribution_column('personcanteenorder', ${personid});" | tr -d '[:space:]'
}

get_shard_node() {
  local shard=$1
  run_psql citus-coordinator -tAc "SELECT nodename FROM pg_dist_shard_placement WHERE shardid=${shard} LIMIT 1;" | tr -d '[:space:]'
}

shard_a=$(get_shard_id ${personid_a})
shard_b=$(get_shard_id ${personid_b})
node_a=$(get_shard_node ${shard_a})
node_b=$(get_shard_node ${shard_b})

table_name() {
  echo "personcanteenorder_${1}"
}

replica_name() {
  case "$1" in
    citus-worker1) echo "citus-worker1-replica" ;;
    citus-worker2) echo "citus-worker2-replica" ;;
    *) echo "" ;;
  esac
}

echo
echo "--- Координатор: проверяем записи ---"
run_psql citus-coordinator -c "SELECT personid, dateorder, dishid FROM personcanteenorder WHERE personid IN (${personid_a}, ${personid_b}) ORDER BY personid;"

check_node() {
  local svc=$1
  local pid=$2
  local shard=$3
  local label=$4
  local table=$(table_name ${shard})
  echo
  echo "--- ${label}: таблица ${table}, personid=${pid} ---"
  run_psql "$svc" -c "SELECT personid, dateorder, dishid FROM ${table} WHERE personid=${pid};"
}

check_node "${node_a}" ${personid_a} ${shard_a} "${node_a} (primary)"
replica_a=$(replica_name ${node_a})
if [ -n "$replica_a" ]; then
  check_node "$replica_a" ${personid_a} ${shard_a} "${replica_a}"
fi

check_node "${node_b}" ${personid_b} ${shard_b} "${node_b} (primary)"
replica_b=$(replica_name ${node_b})
if [ -n "$replica_b" ]; then
  check_node "$replica_b" ${personid_b} ${shard_b} "${replica_b}"
fi

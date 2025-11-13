#!/usr/bin/env bash
set -euo pipefail

COMPOSE_CMD=${COMPOSE_CMD:-"docker compose"}
DB2_SERVICE=${DB2_SERVICE:-"db2"}
DB1_SERVICE=${DB1_SERVICE:-"db1"}

if ! $COMPOSE_CMD ps --status running "$DB2_SERVICE" >/dev/null 2>&1; then
    echo "Service '$DB2_SERVICE' is not running. Start it with 'docker compose up -d $DB2_SERVICE' or 'make build'." >&2
    exit 1
fi
if ! $COMPOSE_CMD ps --status running "$DB1_SERVICE" >/dev/null 2>&1; then
    echo "Service '$DB1_SERVICE' is not running. Start it with 'docker compose up -d $DB1_SERVICE' or 'make build'." >&2
    exit 1
fi

CHECK=$($COMPOSE_CMD exec -T "$DB2_SERVICE" sh -lc "psql -U user -d db2 -tAc \"SELECT to_regclass('public.canteen_price_h_mean_cube') IS NOT NULL\" | tr -d '[:space:]'" 2>/dev/null || true)
if [ "${CHECK}" != "t" ]; then
  echo "Вью canteen_price_h_mean_cube не создана" >&2
  exit 1
fi

# Важно: запись выполняем в db1 напрямую, а чтение — из db2 через FDW.

echo "=== Обновляем вью ==="
$COMPOSE_CMD exec -T "$DB2_SERVICE" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "REFRESH MATERIALIZED VIEW canteen_price_h_mean_cube;"

echo "=== Весь куб ==="
$COMPOSE_CMD exec -T "$DB2_SERVICE" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "
  SELECT dishtype_id, dishtype_name, cook_id, cook_name,
         harmonic_price_per_portion, dish_names
  FROM canteen_price_h_mean_cube
  ORDER BY dishtype_id NULLS FIRST, cook_id NULLS FIRST, dishtype_name, cook_name;"

echo "=== Самый неэффективный повар ==="
echo "Чем больше harmonic_price_per_portion, тем “неэффективнее” повар: за 1 рубль получается меньше порций (в сценарии равного бюджета на позицию)."
$COMPOSE_CMD exec -T "$DB2_SERVICE" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "
  SELECT cook_id, cook_name,
         harmonic_price_per_portion,
         (1.0/harmonic_price_per_portion) AS portions_per_rub
  FROM canteen_price_h_mean_cube
  WHERE dishtype_id IS NULL AND cook_id IS NOT NULL
  ORDER BY harmonic_price_per_portion DESC NULLS LAST
  LIMIT 1;"

echo "=== Демоданные для куба: очистка → проверка отсутствия → вставка → refresh → проверка наличия ==="

echo "— Удаляем старые демо-строки в db1 (dishid IN 10001,10002 | name LIKE 'HM Demo%')"
$COMPOSE_CMD exec -T "$DB1_SERVICE" psql -U user -d db1 -v ON_ERROR_STOP=1 -c "
  DELETE FROM canteendishes WHERE dishid IN (10001,10002) OR dishname LIKE 'HM Demo%';
  SELECT count(*) AS demo_rows_in_canteendishes
  FROM canteendishes WHERE dishid IN (10001,10002) OR dishname LIKE 'HM Demo%';"

echo "— Обновляем куб и показываем группу (dishtype=6, cook=20) — до вставки"
$COMPOSE_CMD exec -T "$DB2_SERVICE" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "
  REFRESH MATERIALIZED VIEW canteen_price_h_mean_cube;
  SELECT dishtype_id, dishtype_name, cook_id, cook_name, harmonic_price_per_portion, dish_names
  FROM canteen_price_h_mean_cube
  WHERE dishtype_id = 6 AND cook_id = 20;"

echo "— Вставляем демо-блюда в db1 под (dishtype=6, cook=20)"
$COMPOSE_CMD exec -T "$DB1_SERVICE" psql -U user -d db1 -v ON_ERROR_STOP=1 -c "
  INSERT INTO canteendishes (dishid, dishname, dishtype, cookid, price)
  VALUES
    (10001, 'HM Demo Salad 1', 6, 20, 35.5),
    (10002, 'HM Demo Salad 2', 6, 20, 62.0);
  SELECT count(*) AS demo_rows_after_insert
  FROM canteendishes WHERE dishid IN (10001,10002) OR dishname LIKE 'HM Demo%';"

echo "— Обновляем куб и показываем группу (dishtype=6, cook=20) — после вставки"
$COMPOSE_CMD exec -T "$DB2_SERVICE" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "
  REFRESH MATERIALIZED VIEW canteen_price_h_mean_cube;
  SELECT dishtype_id, dishtype_name, cook_id, cook_name, harmonic_price_per_portion, dish_names
  FROM canteen_price_h_mean_cube
  WHERE dishtype_id = 6 AND cook_id = 20;"

#!/usr/bin/env bash
set -euo pipefail

COMPOSE_CMD=${COMPOSE_CMD:-"docker compose"}
SERVICE_NAME=${SERVICE_NAME:-"db2"}

if ! $COMPOSE_CMD ps --status running "$SERVICE_NAME" >/dev/null 2>&1; then
    echo "Service '$SERVICE_NAME' is not running. Start it with 'docker compose up -d $SERVICE_NAME' or 'make build'." >&2
    exit 1
fi

CHECK=$($COMPOSE_CMD exec -T "$SERVICE_NAME" sh -lc "psql -U user -d db2 -tAc \"SELECT to_regclass('public.canteen_price_h_mean_cube') IS NOT NULL\" | tr -d '[:space:]'" 2>/dev/null || true)
if [ "${CHECK}" != "t" ]; then
  echo "Вью canteen_price_h_mean_cube не создана" >&2
  exit 1
fi

echo "=== Обновляем вью ==="
$COMPOSE_CMD exec -T "$SERVICE_NAME" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "REFRESH MATERIALIZED VIEW canteen_price_h_mean_cube;"

echo "=== Весь куб ==="
$COMPOSE_CMD exec -T "$SERVICE_NAME" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "
  SELECT dishtype_id, dishtype_name, cook_id, cook_name,
         harmonic_price_per_portion, dish_names
  FROM canteen_price_h_mean_cube
  ORDER BY dishtype_id NULLS FIRST, cook_id NULLS FIRST, dishtype_name, cook_name;"

echo "=== Самый неффективный повар ==="
echo "Чем больше harmonic_price_per_portion, тем “неэффективнее” повар: за 1 рубль получается меньше порций (в сценарии равного бюджета на позицию)."
$COMPOSE_CMD exec -T "$SERVICE_NAME" psql -U user -d db2 -v ON_ERROR_STOP=1 -c "
  SELECT cook_id, cook_name,
         harmonic_price_per_portion,
         (1.0/harmonic_price_per_portion) AS portions_per_rub
  FROM canteen_price_h_mean_cube
  WHERE dishtype_id IS NULL AND cook_id IS NOT NULL
  ORDER BY harmonic_price_per_portion DESC NULLS LAST
  LIMIT 1;"

#!/bin/bash
set -euo pipefail

MASTER_PASSWORD="7777"

echo "[demo] Добавляем мастер-пароль db1"
docker compose exec -T db1 psql -U user -d db1 <<SQL
WITH master_key AS (
  SELECT digest('', 'sha256') AS key_name,
         crypt('${MASTER_PASSWORD}', gen_salt('bf')) AS key_material
)
INSERT INTO keys (key_name_sha256, key_material)
SELECT key_name, key_material FROM master_key
ON CONFLICT (key_name_sha256) DO UPDATE
  SET key_material = EXCLUDED.key_material,
      created_at = now();
SQL

echo "[demo] Сбрасываем предыдущие демо данные"
docker compose exec -T db2 psql -U user -d db2 <<'SQL'
WITH victims AS (
  SELECT digest(email, 'sha256') AS key_name FROM employees
)
DELETE FROM keys WHERE key_name_sha256 IN (SELECT key_name FROM victims);
TRUNCATE TABLE employees RESTART IDENTITY;
SQL

echo "[demo] Добавляем демо данные"
docker compose exec -T db2 psql -U user -d db2 <<'SQL'
SELECT add_employee('Alice', 'alice@example.com', '+1-111-111-1111', 'Engineer', '120000');
SELECT add_employee('Bob', 'bob@example.com', '+1-222-222-2222', 'Manager', '150000');
SELECT add_employee('Carol', 'carol@example.com', '+1-333-333-3333', 'Scientist', '135000');
SELECT add_employee('Dave', 'dave@example.com', '+1-444-444-4444', 'Analyst', '90000');
SELECT add_employee('Eve', 'eve@example.com', '+1-555-555-5555', 'CISO', '200000');
SQL

echo "[demo] Чистый вывод данных"
docker compose exec -T db2 psql -U user -d db2 -c "SELECT id, name, email, phone, \"position\", left(encode(salary,'hex'),3) || '***' AS salary_enc, created_at FROM employees ORDER BY id;"

echo "[demo] Попытка с неправильным паролем"
set +e
docker compose exec -T db2 psql -U user -d db2 -c "SELECT * FROM get_employees_with_salary('wrong-password');"
WRONG_STATUS=$?
set -e
if [ $WRONG_STATUS -eq 0 ]; then
  echo "[demo] Внезапно успех" >&2
  exit 1
else
  echo "[demo] Пароль неправильный"
fi

echo "[demo] Вывод с расшифровкой"
docker compose exec -T db2 psql -U user -d db2 -c "SELECT * FROM get_employees_with_salary('${MASTER_PASSWORD}');"

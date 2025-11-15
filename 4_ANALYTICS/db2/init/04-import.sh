#!/bin/sh
set -e

echo "[db2] Ждем готовности db1 для импорта через FDW..."
for i in $(seq 1 60); do
  if pg_isready -h db1 -p 5432 >/dev/null 2>&1; then
    echo "[db2] db1 готов"
    break
  fi
  sleep 1
done

echo "[db2] Ждем авторизации fdw_reader_db1 в db1..."
for i in $(seq 1 60); do
  if PGPASSWORD=fdw_reader_db1 psql -h db1 -p 5432 -U fdw_reader_db1 -d db1 -tAc 'SELECT 1' >/dev/null 2>&1; then
    echo "[db2] fdw_reader_db1 успешно авторизуется в db1"
    break
  fi
  sleep 1
done

echo "[db2] Импортируем внешнюю схему с сервера cube_server_db1..."
psql -v ON_ERROR_STOP=1 -U fdw_worker_db2 -d db2 <<'SQL'
IMPORT FOREIGN SCHEMA public
  EXCEPT (canteen_price_h_mean_cube)
  FROM SERVER cube_server_db1
  INTO public;
SQL

echo "[db2] Импорт завершен"

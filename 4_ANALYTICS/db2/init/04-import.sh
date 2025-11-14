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

echo "[db2] Ждем авторизации user_connect в db1..."
for i in $(seq 1 60); do
  if PGPASSWORD=user_connect psql -h db1 -p 5432 -U user_connect -d db1 -tAc 'SELECT 1' >/dev/null 2>&1; then
    echo "[db2] user_connect успешно авторизуется в db1"
    break
  fi
  sleep 1
done

echo "[db2] Импортируем внешнюю схему с сервера my_work_server_name..."
psql -v ON_ERROR_STOP=1 -U user_connect -d user_connect -d db2 <<'SQL'
IMPORT FOREIGN SCHEMA public
  FROM SERVER my_work_server_name
  INTO public;
SQL

echo "[db2] Импорт завершен"

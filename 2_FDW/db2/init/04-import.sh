#!/bin/sh
set -e

echo "[db2] Waiting for db1 to be ready for FDW import..."
for i in $(seq 1 60); do
  if pg_isready -h db1 -p 5432 >/dev/null 2>&1; then
    echo "[db2] db1 is ready"
    break
  fi
  sleep 1
done

echo "[db2] Waiting for user_connect auth on db1..."
for i in $(seq 1 60); do
  if PGPASSWORD=user_connect psql -h db1 -p 5432 -U user_connect -d db1 -tAc 'SELECT 1' >/dev/null 2>&1; then
    echo "[db2] user_connect can authenticate to db1"
    break
  fi
  sleep 1
done

echo "[db2] Importing foreign schema from my_work_server_name..."
psql -v ON_ERROR_STOP=1 -U user_connect -d user_connect -d db2 <<'SQL'
IMPORT FOREIGN SCHEMA public
  FROM SERVER my_work_server_name
  INTO public;
SQL

echo "[db2] Import complete"

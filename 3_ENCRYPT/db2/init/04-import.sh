#!/bin/sh
set -e

SSL_ROOT_CERT="/certs/db1-server.crt"

echo "[db2] Waiting for db1 SSL certificate..."
for i in $(seq 1 60); do
  if [ -f "$SSL_ROOT_CERT" ]; then
    echo "[db2] Found db1 certificate"
    break
  fi
  sleep 1
done

if [ ! -f "$SSL_ROOT_CERT" ]; then
  echo "[db2] Timed out waiting for db1 certificate" >&2
  exit 1
fi

echo "[db2] Waiting for db1 to be ready for FDW import..."
for i in $(seq 1 60); do
  if PGSSLMODE=verify-full PGSSLROOTCERT="$SSL_ROOT_CERT" pg_isready -h db1 -p 5432 >/dev/null 2>&1; then
    echo "[db2] db1 is ready"
    break
  fi
  sleep 1
done

echo "[db2] Waiting for user_connect auth on db1..."
for i in $(seq 1 60); do
  if PGSSLMODE=verify-full PGSSLROOTCERT="$SSL_ROOT_CERT" PGPASSWORD=user_connect psql -h db1 -p 5432 -U user_connect -d db1 -tAc 'SELECT 1' >/dev/null 2>&1; then
    echo "[db2] user_connect can authenticate to db1"
    break
  fi
  sleep 1
done

echo "[db2] Importing foreign schema from my_work_server_name..."
PGSSLMODE=verify-full PGSSLROOTCERT="$SSL_ROOT_CERT" PGPASSWORD=user_connect psql -v ON_ERROR_STOP=1 -U user_connect -d db2 <<'SQL'
IMPORT FOREIGN SCHEMA public
  FROM SERVER my_work_server_name
  INTO public;
SQL

echo "[db2] Import complete"

#!/bin/sh
set -eu

CLIENT_SUBNETS=${CLIENT_SUBNETS:-"172.16.0.0/12 10.0.0.0/8 192.168.0.0/16"}

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<'EOSQL'
CREATE EXTENSION IF NOT EXISTS citus;
DO $$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'repl_user') THEN
      CREATE ROLE repl_user WITH REPLICATION LOGIN PASSWORD 'repl_password';
   END IF;
END$$;
EOSQL

ARCHIVE_DIR="/var/lib/postgresql/archive"
mkdir -p "$ARCHIVE_DIR"
chown postgres:postgres "$ARCHIVE_DIR"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<'EOSQL'
ALTER SYSTEM SET listen_addresses = '*';
ALTER SYSTEM SET wal_level = 'replica';
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET max_replication_slots = 10;
ALTER SYSTEM SET wal_keep_size = '1GB';
ALTER SYSTEM SET archive_mode = 'on';
ALTER SYSTEM SET archive_command = 'test ! -f /var/lib/postgresql/archive/%f && cp %p /var/lib/postgresql/archive/%f';
ALTER SYSTEM SET shared_preload_libraries = 'citus';
EOSQL

HBA_FILE="$PGDATA/pg_hba.conf"

ensure_entry() {
  local entry=$1
  if ! grep -q "$entry" "$HBA_FILE"; then
    printf '%s\n' "$entry" >> "$HBA_FILE"
  fi
}

if ! grep -q "host replication repl_user" "$HBA_FILE"; then
  for subnet in $CLIENT_SUBNETS; do
    ensure_entry "host replication repl_user ${subnet} scram-sha-256"
  done
fi

if ! grep -q "host all postgres" "$HBA_FILE"; then
  tmp_file=$(mktemp)
  for subnet in $CLIENT_SUBNETS; do
    printf 'host all postgres %s trust\n' "$subnet" >> "$tmp_file"
  done
  cat "$HBA_FILE" >> "$tmp_file"
  mv "$tmp_file" "$HBA_FILE"
fi

if ! grep -q "host all all" "$HBA_FILE"; then
  for subnet in $CLIENT_SUBNETS; do
    ensure_entry "host all all ${subnet} scram-sha-256"
  done
  ensure_entry "host all all 127.0.0.1/32 scram-sha-256"
fi

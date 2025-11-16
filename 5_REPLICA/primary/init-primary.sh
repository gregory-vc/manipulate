#!/bin/sh
set -eu

CLIENT_SUBNETS=${CLIENT_SUBNETS:-"172.16.0.0/12 192.168.0.0/16"}

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<'EOSQL'
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
EOSQL

HBA_FILE="$PGDATA/pg_hba.conf"

if ! grep -q "host replication repl_user" "$HBA_FILE"; then
  for subnet in $CLIENT_SUBNETS; do
cat <<EOF >> "$HBA_FILE"
host replication repl_user ${subnet} scram-sha-256
EOF
  done
fi

if ! grep -q "host all all" "$HBA_FILE"; then
  for subnet in $CLIENT_SUBNETS; do
cat <<EOF >> "$HBA_FILE"
host all all ${subnet} scram-sha-256
EOF
  done
cat <<'EOF' >> "$HBA_FILE"
host all all 127.0.0.1/32 scram-sha-256
EOF
fi

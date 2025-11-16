#!/bin/sh
set -eu

PRIMARY_HOST=${PRIMARY_HOST:-citus-worker1}
PRIMARY_PORT=${PRIMARY_PORT:-5432}
REPLICATION_USER=${REPLICATION_USER:-repl_user}
REPLICATION_PASSWORD=${REPLICATION_PASSWORD:-repl_password}
REPLICATION_SLOT=${REPLICATION_SLOT:-replica_slot}
PGDATA=${PGDATA:-/var/lib/postgresql/data}

mkdir -p "$PGDATA"

await_primary() {
  until pg_isready -h "$PRIMARY_HOST" -p "$PRIMARY_PORT" >/dev/null 2>&1; do
    echo "Waiting for primary ${PRIMARY_HOST}:${PRIMARY_PORT}..."
    sleep 2
  done
}

bootstrap_replica() {
  rm -rf "$PGDATA"/*
  await_primary
  export PGPASSWORD="$REPLICATION_PASSWORD"
  pg_basebackup \
    -h "$PRIMARY_HOST" \
    -p "$PRIMARY_PORT" \
    -U "$REPLICATION_USER" \
    -D "$PGDATA" \
    -Fp -Xs -P \
    -R -C -S "$REPLICATION_SLOT"
  unset PGPASSWORD
  chown -R postgres:postgres "$PGDATA"
}

if [ ! -s "$PGDATA/PG_VERSION" ]; then
  bootstrap_replica
fi

exec /usr/local/bin/docker-entrypoint.sh "postgres" "-c" "listen_addresses=*" "-c" "hot_standby=on"

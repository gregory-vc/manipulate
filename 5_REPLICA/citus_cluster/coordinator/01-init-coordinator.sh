#!/bin/bash
set -euo pipefail

wait_for() {
  local host=$1
  local port=$2
  until pg_isready -h "$host" -p "$port" >/dev/null 2>&1; do
    echo "Waiting for ${host}:${port}..."
    sleep 2
  done
}

wait_for "citus-worker1" 5432
wait_for "citus-worker2" 5432

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<'EOSQL'
CREATE EXTENSION IF NOT EXISTS citus;
DO $$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_dist_node WHERE nodename = 'citus-worker1' AND nodeport = 5432) THEN
      PERFORM master_add_node('citus-worker1', 5432);
   END IF;
   IF NOT EXISTS (SELECT 1 FROM pg_dist_node WHERE nodename = 'citus-worker2' AND nodeport = 5432) THEN
      PERFORM master_add_node('citus-worker2', 5432);
   END IF;
END$$;
EOSQL

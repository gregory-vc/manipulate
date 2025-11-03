#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
COMPOSE=(docker compose -f "$ROOT_DIR/docker-compose.yml")
TARGET_DIR="$ROOT_DIR/backups/plain_types"
mkdir -p "$TARGET_DIR"

echo "Waiting for db1 to become ready..."
until "${COMPOSE[@]}" exec -T db1 pg_isready -U user -d db1 >/dev/null 2>&1; do
  sleep 1
done

dump_schema() {
  echo "Dumping schema-only script"
  "${COMPOSE[@]}" exec -T db1 pg_dump -U user --clean --if-exists --schema-only db1 > "$TARGET_DIR/db1_schema_only.sql"
}

dump_data() {
  echo "Dumping data-only script"
  "${COMPOSE[@]}" exec -T db1 pg_dump -U user --data-only db1 > "$TARGET_DIR/db1_data_only.sql"
}

case "${1:-all}" in
  schema)
    dump_schema
    ;;
  data)
    dump_data
    ;;
  all)
    dump_schema
    dump_data
    ;;
  *)
    echo "Unknown type selector: ${1}" >&2
    echo "Use schema, data, or all" >&2
    exit 1
    ;;
esac

echo "Type-specific backups are stored in $TARGET_DIR"

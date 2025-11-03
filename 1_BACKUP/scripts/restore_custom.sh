#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
COMPOSE=(docker compose -f "$ROOT_DIR/docker-compose.yml")

SOURCE="${1:-$ROOT_DIR/backups/db1_custom.dump}"

if [[ ! -f "$SOURCE" ]]; then
  echo "Backup file not found: $SOURCE" >&2
  exit 1
fi

echo "Waiting for db1 to become ready..."
until "${COMPOSE[@]}" exec -T db1 pg_isready -U user -d db1 >/dev/null 2>&1; do
  sleep 1
done

echo "Restoring db1 from $SOURCE"
"${COMPOSE[@]}" exec -T db1 pg_restore -U user -d db1 --clean --if-exists < "$SOURCE"
echo "Restore completed."

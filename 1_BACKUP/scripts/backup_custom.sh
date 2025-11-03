#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
COMPOSE=(docker compose -f "$ROOT_DIR/docker-compose.yml")
BACKUPS="$ROOT_DIR/backups"
mkdir -p "$BACKUPS"

echo "Waiting for db1 to become ready..."
until "${COMPOSE[@]}" exec -T db1 pg_isready -U user -d db1 >/dev/null 2>&1; do
  sleep 1
done

OUTPUT="${1:-db1_custom.dump}"
TARGET="$BACKUPS/$OUTPUT"

echo "Writing custom-format backup to $TARGET"
"${COMPOSE[@]}" exec -T db1 pg_dump -U user --clean --if-exists --format=custom db1 > "$TARGET"
echo "Backup completed."

#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
COMPOSE=(docker compose -f "$ROOT_DIR/docker-compose.yml")
HOST_DIR="$ROOT_DIR/backups/directory"

SOURCE="${1:-}"
if [[ -z "$SOURCE" ]]; then
  SOURCE=$(ls -dt "$HOST_DIR"/* 2>/dev/null | head -n 1 || true)
  if [[ -z "$SOURCE" ]]; then
    echo "No directory backups found in $HOST_DIR" >&2
    exit 1
  fi
  echo "Using latest directory backup: $SOURCE"
fi

if [[ ! -d "$SOURCE" ]]; then
  echo "Source directory not found: $SOURCE" >&2
  exit 1
fi

echo "Waiting for db1 to become ready..."
until "${COMPOSE[@]}" exec -T db1 pg_isready -U user -d db1 >/dev/null 2>&1; do
  sleep 1
done

NAME=$(basename "$SOURCE")
CONTAINER_PATH="/tmp/$NAME"

echo "Copying $SOURCE into container path $CONTAINER_PATH"
"${COMPOSE[@]}" exec -T db1 bash -lc "rm -rf '$CONTAINER_PATH'"
"${COMPOSE[@]}" cp "$SOURCE" db1:"$CONTAINER_PATH"

echo "Restoring db1 from directory backup"
"${COMPOSE[@]}" exec -T db1 pg_restore -U user -d db1 -c "$CONTAINER_PATH"
"${COMPOSE[@]}" exec -T db1 bash -lc "rm -rf '$CONTAINER_PATH'"

echo "Directory restore completed."

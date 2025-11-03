#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
COMPOSE=(docker compose -f "$ROOT_DIR/docker-compose.yml")
HOST_DIR="$ROOT_DIR/backups/directory"
mkdir -p "$HOST_DIR"

echo "Waiting for db1 to become ready..."
until "${COMPOSE[@]}" exec -T db1 pg_isready -U user -d db1 >/dev/null 2>&1; do
  sleep 1
done

STAMP=$(date +%Y%m%d_%H%M%S)
NAME="${1:-db1_directory_$STAMP}"
HOST_PATH="$HOST_DIR/$NAME"
CONTAINER_PATH="/tmp/$NAME"

if [[ -e "$HOST_PATH" ]]; then
  echo "Target already exists: $HOST_PATH" >&2
  exit 1
fi

echo "Creating directory-format backup at $HOST_PATH"
"${COMPOSE[@]}" exec -T db1 bash -lc "rm -rf '$CONTAINER_PATH'"
"${COMPOSE[@]}" exec -T db1 pg_dump -U user --clean --if-exists -F d -f "$CONTAINER_PATH" db1
"${COMPOSE[@]}" cp db1:"$CONTAINER_PATH" "$HOST_PATH"
"${COMPOSE[@]}" exec -T db1 bash -lc "rm -rf '$CONTAINER_PATH'"

echo "Directory backup stored at $HOST_PATH"

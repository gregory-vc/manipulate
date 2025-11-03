#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

ensure_backup_dir
mkdir -p "$BACKUP_ROOT/directory"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_NAME="${1:-db1_directory_$TIMESTAMP}"
HOST_TARGET="$BACKUP_ROOT/directory/$OUTPUT_NAME"
CONTAINER_DIR="/tmp/$OUTPUT_NAME"

if [[ -e "$HOST_TARGET" ]]; then
  echo "Target already exists: $HOST_TARGET" >&2
  exit 1
fi

echo "Preparing directory backup in container path $CONTAINER_DIR"
compose exec -T "$DB_SERVICE" bash -lc "rm -rf '$CONTAINER_DIR'"
compose exec -T "$DB_SERVICE" pg_dump -U "$PGUSER" --clean --if-exists "$PGDATABASE" -F d -f "$CONTAINER_DIR"

echo "Copying backup to host at $HOST_TARGET"
compose cp "$DB_SERVICE:$CONTAINER_DIR" "$HOST_TARGET"

echo "Cleaning up container path"
compose exec -T "$DB_SERVICE" bash -lc "rm -rf '$CONTAINER_DIR'"

echo "Directory backup stored at $HOST_TARGET"

#!/usr/bin/env bash
set -euo pipefail

# Restore the database from a directory-format backup.

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

ensure_backup_dir
mkdir -p "$BACKUP_ROOT/directory"

SOURCE_PATH="${1:-}"

if [[ -z "$SOURCE_PATH" ]]; then
  SOURCE_PATH=$(ls -dt "$BACKUP_ROOT"/directory/* 2>/dev/null | head -n 1 || true)
  if [[ -z "$SOURCE_PATH" ]]; then
    echo "No directory backups found in $BACKUP_ROOT/directory" >&2
    exit 1
  fi
  echo "Using latest directory backup: $SOURCE_PATH"
fi

if [[ ! -d "$SOURCE_PATH" ]]; then
  echo "Source directory not found: $SOURCE_PATH" >&2
  exit 1
fi

BASENAME=$(basename "$SOURCE_PATH")
CONTAINER_DIR="/tmp/$BASENAME"

echo "Copying $SOURCE_PATH into container path $CONTAINER_DIR"
compose exec -T "$DB_SERVICE" bash -lc "rm -rf '$CONTAINER_DIR'"
compose cp "$SOURCE_PATH" "$DB_SERVICE:$CONTAINER_DIR"

echo "Restoring $PGDATABASE from directory backup"
compose exec -T "$DB_SERVICE" pg_restore -U "$PGUSER" -d "$PGDATABASE" -c "$CONTAINER_DIR"

echo "Cleaning up container path"
compose exec -T "$DB_SERVICE" bash -lc "rm -rf '$CONTAINER_DIR'"

echo "Directory restore completed."

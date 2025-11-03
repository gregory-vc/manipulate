#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(dirname "$SCRIPT_DIR")
COMPOSE_FILE="$PROJECT_ROOT/docker-compose.yml"
BACKUP_ROOT="$PROJECT_ROOT/backups"
DB_SERVICE="${DB_SERVICE:-db1}"
PGDATABASE="${PGDATABASE:-db1}"
PGUSER="${PGUSER:-user}"

COMPOSE_CMD=(docker compose -f "$COMPOSE_FILE")

compose() {
  "${COMPOSE_CMD[@]}" "$@"
}

ensure_backup_dir() {
  mkdir -p "$BACKUP_ROOT"
}

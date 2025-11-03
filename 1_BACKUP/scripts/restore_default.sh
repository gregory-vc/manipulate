#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

INPUT_PATH="${1:-$BACKUP_ROOT/db1_default.sql}"

if [[ ! -f "$INPUT_PATH" ]]; then
  echo "Backup file not found: $INPUT_PATH" >&2
  exit 1
fi

echo "Restoring $PGDATABASE from $INPUT_PATH"
compose exec -T "$DB_SERVICE" psql -U "$PGUSER" "$PGDATABASE" < "$INPUT_PATH"
echo "Restore completed."

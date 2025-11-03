#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

ensure_backup_dir

OUTPUT_NAME="${1:-db1_default.sql}"
OUTPUT_PATH="$BACKUP_ROOT/$OUTPUT_NAME"

echo "Writing default backup to $OUTPUT_PATH"
compose exec -T "$DB_SERVICE" pg_dump -U "$PGUSER" --clean --if-exists "$PGDATABASE" > "$OUTPUT_PATH"
echo "Backup completed."

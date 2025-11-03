#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

ensure_backup_dir

TARGET_DIR="$BACKUP_ROOT/plain_sections"
mkdir -p "$TARGET_DIR"

flag_for_section() {
  local label=$1
  case "$label" in
    pre-data) echo "--section=pre-data" ;;
    data) echo "--section=data" ;;
    post-data) echo "--section=post-data" ;;
    *)
      echo "Unknown section: $label" >&2
      echo "Available sections: pre-data data post-data" >&2
      return 1
      ;;
  esac
}

order=("pre-data" "data" "post-data")
queue=()

if [[ $# -gt 0 ]]; then
  for label in "$@"; do
    queue+=("$label")
  done
else
  queue=("${order[@]}")
fi

for label in "${queue[@]}"; do
  flags=$(flag_for_section "$label")
  sanitized="${label//-/_}"
  output_path="$TARGET_DIR/db1_section_${sanitized}.sql"
  echo "Dumping section '${label}' to $output_path"
  compose exec -T "$DB_SERVICE" pg_dump -U "$PGUSER" --clean --if-exists "$PGDATABASE" $flags > "$output_path"
done

echo "Section-specific backups are stored in $TARGET_DIR"
  sanitized="${label//-/_}"
  output_path="$TARGET_DIR/db1_section_${sanitized}.sql"
  echo "Dumping section '${label}' to $output_path"
  compose exec -T "$DB_SERVICE" pg_dump -U "$PGUSER" --clean --if-exists "$PGDATABASE" $flags > "$output_path"
done

echo "Section-specific backups are stored in $TARGET_DIR"

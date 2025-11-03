#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

ensure_backup_dir

TARGET_DIR="$BACKUP_ROOT/plain_types"
mkdir -p "$TARGET_DIR"

declare -A TYPE_FLAGS=(
  ["schema"]="--schema-only"
  ["data"]="--data-only"
)

order=("schema" "data")
queue=()

if [[ $# -gt 0 ]]; then
  for label in "$@"; do
    if [[ -z "${TYPE_FLAGS["$label"]:-}" ]]; then
      echo "Unknown type selector: $label" >&2
      echo "Available selectors: ${!TYPE_FLAGS[*]}" >&2
      exit 1
    fi
    queue+=("$label")
  done
else
  queue=("${order[@]}")
fi

for label in "${queue[@]}"; do
  flag="${TYPE_FLAGS["$label"]}"
  output_path="$TARGET_DIR/db1_${label}_only.sql"
  echo "Dumping '${label}' view to $output_path"
  compose exec -T "$DB_SERVICE" pg_dump -U "$PGUSER" --clean --if-exists "$PGDATABASE" $flag > "$output_path"
done

echo "Type-specific backups are stored in $TARGET_DIR"

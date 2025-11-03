#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
COMPOSE=(docker compose -f "$ROOT_DIR/docker-compose.yml")
TARGET_DIR="$ROOT_DIR/backups/plain_sections"
mkdir -p "$TARGET_DIR"

echo "Waiting for db1 to become ready..."
until "${COMPOSE[@]}" exec -T db1 pg_isready -U user -d db1 >/dev/null 2>&1; do
  sleep 1
done

run_dump() {
  local section=$1
  local label=${section//-/_}
  echo "Dumping ${section} section"
  "${COMPOSE[@]}" exec -T db1 pg_dump -U user --clean --if-exists --section="$section" db1 > "$TARGET_DIR/db1_section_${label}.sql"
}

case "${1:-all}" in
  pre-data|data|post-data)
    run_dump "$1"
    ;;
  all)
    run_dump pre-data
    run_dump data
    run_dump post-data
    ;;
  *)
    echo "Unknown section selector: ${1}" >&2
    echo "Use pre-data, data, post-data, or all" >&2
    exit 1
    ;;
esac

echo "Section-specific backups are stored in $TARGET_DIR"

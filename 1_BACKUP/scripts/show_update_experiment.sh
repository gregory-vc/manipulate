#!/usr/bin/env bash
set -euo pipefail

# Show experiment row, update year to 2025, then show it again.

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

compose exec -T "$DB_SERVICE" psql -U "$PGUSER" "$PGDATABASE" -v ON_ERROR_STOP=1 <<'SQL'
BEGIN;
SELECT * FROM experiments WHERE id = 14;
UPDATE experiments SET year = 2025 WHERE id = 14;
SELECT * FROM experiments WHERE id = 14;
COMMIT;
SQL

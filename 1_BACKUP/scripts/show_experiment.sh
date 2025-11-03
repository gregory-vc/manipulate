#!/usr/bin/env bash
set -euo pipefail

# Show experiment row with id=14.

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/common.sh"

compose exec -T "$DB_SERVICE" psql -U "$PGUSER" "$PGDATABASE" -c "SELECT * FROM experiments WHERE id = 14;"

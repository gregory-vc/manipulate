#!/bin/sh
set -e

HBA_FILE="$PGDATA/pg_hba.conf"
if [ -f "$HBA_FILE" ]; then
  if grep -q "[[:space:]]md5\b" "$HBA_FILE"; then
    sed -i 's/[[:space:]]md5\b/ scram-sha-256/g' "$HBA_FILE" || true
  fi
  if ! grep -q "scram-sha-256" "$HBA_FILE"; then
    {
      echo "# Enforce SCRAM for all host connections (added by init script)"
      echo "host all all 0.0.0.0/0 scram-sha-256"
      echo "host all all ::/0 scram-sha-256"
      cat "$HBA_FILE"
    } >"$HBA_FILE.new" && mv "$HBA_FILE.new" "$HBA_FILE"
  fi
fi

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "ALTER SYSTEM SET password_encryption = 'scram-sha-256';"

if [ -n "$POSTGRES_PASSWORD" ]; then
  psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<SQL
SET password_encryption = 'scram-sha-256';
ALTER ROLE "$POSTGRES_USER" WITH PASSWORD '$POSTGRES_PASSWORD';
SQL
fi


#!/bin/sh
set -e

# Enforce SCRAM on host connections in pg_hba.conf
HBA_FILE="$PGDATA/pg_hba.conf"
if [ -f "$HBA_FILE" ]; then
  # If file has md5, replace with scram-sha-256
  if grep -q "[[:space:]]md5\b" "$HBA_FILE"; then
    sed -i 's/[[:space:]]md5\b/ scram-sha-256/g' "$HBA_FILE" || true
  fi
  # Ensure top-priority SCRAM rules for all hosts (IPv4/IPv6)
  if ! grep -q "scram-sha-256" "$HBA_FILE"; then
    {
      echo "# Enforce SCRAM for all host connections (added by init script)"
      echo "host all all 0.0.0.0/0 scram-sha-256"
      echo "host all all ::/0 scram-sha-256"
      cat "$HBA_FILE"
    } >"$HBA_FILE.new" && mv "$HBA_FILE.new" "$HBA_FILE"
  fi
fi

# Force global default to SCRAM for future password changes
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "ALTER SYSTEM SET password_encryption = 'scram-sha-256';"

# In-session set + rehash bootstrap user's password using SCRAM (if provided)
if [ -n "$POSTGRES_PASSWORD" ]; then
  psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<SQL
SET password_encryption = 'scram-sha-256';
ALTER ROLE "$POSTGRES_USER" WITH PASSWORD '$POSTGRES_PASSWORD';
SQL
fi


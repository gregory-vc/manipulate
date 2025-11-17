#!/usr/bin/env bash
set -euo pipefail

# Wait for Postgres to accept connections before running code generation
until pg_isready -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" >/dev/null 2>&1; do
  sleep 1
done

psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -f /workspace/db/generate.sql

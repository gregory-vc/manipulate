#!/bin/sh
set -eu

CERT_SUBJ="/CN=db2"
SHARED_SSL_DIR="/var/lib/postgresql/shared-ssl"
SHARED_CERT="$SHARED_SSL_DIR/db2-server.crt"

mkdir -p "$SHARED_SSL_DIR"

cd "$PGDATA"

if [ ! -f server.crt ] || [ ! -f server.key ]; then
  openssl req -new -nodes -text -keyout privkey.pem -out server.req -subj "$CERT_SUBJ" -addext "subjectAltName=DNS:db2"
  openssl rsa -in privkey.pem -out server.key
  chmod 600 server.key
  openssl req -x509 -in server.req -text -key server.key -out server.crt -days 365
  chmod 644 server.crt
  rm -f privkey.pem server.req
fi

cp -f server.crt "$SHARED_CERT"
chmod 644 "$SHARED_CERT"

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<'SQL'
ALTER SYSTEM SET ssl = 'on';
ALTER SYSTEM SET ssl_cert_file = 'server.crt';
ALTER SYSTEM SET ssl_key_file = 'server.key';
SQL

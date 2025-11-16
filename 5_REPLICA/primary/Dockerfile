FROM postgres:18.0-alpine

COPY init-primary.sh /docker-entrypoint-initdb.d/01-init-primary.sh
COPY 02-CANTEENDISHES.sql /docker-entrypoint-initdb.d/02-CANTEENDISHES.sql

RUN chmod +x /docker-entrypoint-initdb.d/01-init-primary.sh

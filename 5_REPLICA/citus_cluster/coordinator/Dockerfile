FROM citusdata/citus:13.2.0

COPY coordinator/01-init-coordinator.sh /docker-entrypoint-initdb.d/01-init-coordinator.sh
COPY data/01-create-personcanteenorder.sql /docker-entrypoint-initdb.d/02-create-personcanteenorder.sql
COPY coordinator/03-distribute-personcanteenorder.sql /docker-entrypoint-initdb.d/03-distribute-personcanteenorder.sql
COPY coordinator/04-place-shards.sql /docker-entrypoint-initdb.d/04-place-shards.sql
COPY data/02-insert-personcanteenorder.sql /docker-entrypoint-initdb.d/05-insert-personcanteenorder.sql

RUN chmod +x /docker-entrypoint-initdb.d/01-init-coordinator.sh

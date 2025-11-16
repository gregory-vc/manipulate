FROM citusdata/citus:13.2.0

COPY worker-primary/init-worker.sh /docker-entrypoint-initdb.d/01-init-worker.sh

RUN chmod +x /docker-entrypoint-initdb.d/01-init-worker.sh

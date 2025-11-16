FROM citusdata/citus:13.2.0

COPY worker-replica/replica-entrypoint.sh /usr/local/bin/replica-entrypoint.sh

RUN chmod +x /usr/local/bin/replica-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/replica-entrypoint.sh"]

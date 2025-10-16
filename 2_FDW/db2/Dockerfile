FROM postgres:18.0-alpine

# Copy initialization scripts (optional). Any .sql/.sh here runs on first start.
COPY init/ /docker-entrypoint-initdb.d/


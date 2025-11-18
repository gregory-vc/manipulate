FROM postgres:18

# Copy initialization scripts to seed the database schema at first startup
COPY init/ /docker-entrypoint-initdb.d/

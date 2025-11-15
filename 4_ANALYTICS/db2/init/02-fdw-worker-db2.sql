CREATE USER fdw_worker_db2 WITH PASSWORD 'fdw_worker_db2';

GRANT CONNECT ON DATABASE db2 TO fdw_worker_db2;
GRANT USAGE, CREATE ON SCHEMA public TO fdw_worker_db2;

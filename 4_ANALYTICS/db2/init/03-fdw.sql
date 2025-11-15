CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER cube_server_db1
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'db1', port '5432', dbname 'db1');

GRANT USAGE ON FOREIGN SERVER cube_server_db1 TO fdw_worker_db2;
GRANT USAGE ON FOREIGN SERVER cube_server_db1 TO CURRENT_USER;

CREATE USER MAPPING IF NOT EXISTS FOR fdw_worker_db2
  SERVER cube_server_db1
  OPTIONS (user 'fdw_reader_db1', password 'fdw_reader_db1');

CREATE USER MAPPING IF NOT EXISTS FOR CURRENT_USER
  SERVER cube_server_db1
  OPTIONS (user 'fdw_reader_db1', password 'fdw_reader_db1');

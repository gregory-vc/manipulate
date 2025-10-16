CREATE USER user_connect WITH PASSWORD 'user_connect';

GRANT CONNECT ON DATABASE db2
TO user_connect;

GRANT USAGE ON SCHEMA public TO user_connect;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public TO user_connect;

GRANT USAGE, SELECT ON ALL SEQUENCES
IN SCHEMA public TO user_connect;

CREATE EXTENSION postgres_fdw;

CREATE SERVER my_work_server_name
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'db1', port '5432', dbname 'db1');

CREATE USER MAPPING FOR user_connect
SERVER my_work_server
OPTIONS(USER 'user_connect', password 'user_connect');
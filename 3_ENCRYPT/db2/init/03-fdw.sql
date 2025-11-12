CREATE USER user_connect WITH PASSWORD 'user_connect';

GRANT CONNECT ON DATABASE db2
TO user_connect;

GRANT USAGE ON SCHEMA public TO user_connect;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public TO user_connect;

GRANT USAGE, SELECT ON ALL SEQUENCES
IN SCHEMA public TO user_connect;

GRANT CONNECT ON DATABASE db2
TO CURRENT_USER;

GRANT USAGE ON SCHEMA public TO CURRENT_USER;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public TO CURRENT_USER;

GRANT USAGE, SELECT ON ALL SEQUENCES
IN SCHEMA public TO CURRENT_USER;

CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER my_work_server_name
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'db1',
    port '5432',
    dbname 'db1',
    sslmode 'verify-full',
    sslrootcert '/var/lib/postgresql/shared-ssl/db1-server.crt'
);

CREATE USER MAPPING IF NOT EXISTS FOR user_connect
SERVER my_work_server_name
OPTIONS (user 'user_connect', password 'user_connect');

GRANT USAGE ON FOREIGN SERVER my_work_server_name TO user_connect;

GRANT USAGE, CREATE ON SCHEMA public TO user_connect;
GRANT USAGE ON FOREIGN SERVER my_work_server_name TO user_connect;

GRANT USAGE, CREATE ON SCHEMA public TO CURRENT_USER;
GRANT USAGE ON FOREIGN SERVER my_work_server_name TO CURRENT_USER;

GRANT USAGE ON FOREIGN SERVER my_work_server_name TO PUBLIC;
CREATE USER MAPPING IF NOT EXISTS FOR PUBLIC
SERVER my_work_server_name
OPTIONS (user 'user_connect', password 'user_connect');

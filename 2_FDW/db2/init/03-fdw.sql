CREATE USER user_connect WITH PASSWORD 'user_connect';

GRANT CONNECT ON DATABASE db2
TO user_connect;

GRANT USAGE ON SCHEMA public TO user_connect;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public TO user_connect;

GRANT USAGE, SELECT ON ALL SEQUENCES
IN SCHEMA public TO user_connect;

CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- Create FDW server pointing to db1
CREATE SERVER my_work_server_name
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'db1', port '5432', dbname 'db1');

-- User mappings: allow both superuser (sounder) and app user to use the server
CREATE USER MAPPING IF NOT EXISTS FOR user_connect
SERVER my_work_server_name
OPTIONS (user 'user_connect', password 'user_connect');

GRANT USAGE ON FOREIGN SERVER my_work_server_name TO user_connect;

-- Ensure the executing role can create objects in target schema for IMPORT
GRANT USAGE, CREATE ON SCHEMA public TO CURRENT_USER;
GRANT USAGE ON FOREIGN SERVER my_work_server_name TO CURRENT_USER;

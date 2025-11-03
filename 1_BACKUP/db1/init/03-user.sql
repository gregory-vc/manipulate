CREATE USER user_connect WITH PASSWORD 'user_connect';

GRANT CONNECT ON DATABASE db1
TO user_connect;

GRANT USAGE ON SCHEMA public TO user_connect;

GRANT SELECT
ON ALL TABLES IN SCHEMA public TO user_connect;

GRANT USAGE, SELECT ON ALL SEQUENCES
IN SCHEMA public TO user_connect;

GRANT USAGE, CREATE ON SCHEMA public TO user_connect;
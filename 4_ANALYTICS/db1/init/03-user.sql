CREATE USER user_connect WITH PASSWORD 'user_connect';

GRANT CONNECT ON DATABASE db1 TO user_connect;

-- Read-only access for FDW consumer (db2)
GRANT USAGE ON SCHEMA public TO user_connect;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO user_connect;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO user_connect;
-- Do NOT allow CREATE on schema; keep user_connect strictly read-only

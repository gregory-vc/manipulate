CREATE USER user_connect WITH PASSWORD 'user_connect';

GRANT CONNECT ON DATABASE db1 TO user_connect;

-- Доступ только на чтение для потребителя через FDW (db2)
GRANT USAGE ON SCHEMA public TO user_connect;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO user_connect;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO user_connect;
-- Не даем CREATE на схеме: user_connect строго read-only

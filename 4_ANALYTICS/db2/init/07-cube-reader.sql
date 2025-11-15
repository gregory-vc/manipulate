-- Пользователь только для чтения куба в db2
CREATE USER fdw_reader_db2 WITH PASSWORD 'fdw_reader_db2';

GRANT CONNECT ON DATABASE db2 TO fdw_reader_db2;
GRANT USAGE ON SCHEMA public TO fdw_reader_db2;

-- Даем право SELECT только на материализованное представление
GRANT SELECT ON TABLE canteen_price_h_mean_cube TO fdw_reader_db2;

-- Никаких дополнительных прав: fdw_reader_db2 ничего не изменяет

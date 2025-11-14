-- Пользователь только для чтения куба в db2
CREATE USER cube_reader WITH PASSWORD 'cube_reader';

GRANT CONNECT ON DATABASE db2 TO cube_reader;
GRANT USAGE ON SCHEMA public TO cube_reader;

-- Даем право SELECT только на материализованное представление (как на таблицу)
GRANT SELECT ON TABLE canteen_price_h_mean_cube TO cube_reader;

-- Удобная обертка-вид над материализованным представлением (для FDW-импорта)
CREATE OR REPLACE VIEW v_canteen_price_h_mean_cube AS
SELECT dishtype_id, dishtype_name, cook_id, cook_name,
       harmonic_price_per_portion, dish_names
FROM canteen_price_h_mean_cube;

-- Права на чтение только этого вида
GRANT SELECT ON TABLE v_canteen_price_h_mean_cube TO cube_reader;

-- Никаких дополнительных прав: cube_reader ничего не изменяет

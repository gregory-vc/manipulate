-- Настраиваем FDW в db1 для доступа к кубу в db2 под пользователем cube_reader
-- Важно: не ждем готовности db2 и не подключаемся к нему на этапе инициализации,
-- поэтому избегаем дедлока. Определяем только сервер, маппинг и локальную внешнюю таблицу.

CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER IF NOT EXISTS cube_server_db2
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'db2', port '5432', dbname 'db2');

-- Локальный пользователь db1 (CURRENT_USER) будет подключаться к db2 как cube_reader (только чтение)
CREATE USER MAPPING IF NOT EXISTS FOR CURRENT_USER
  SERVER cube_server_db2
  OPTIONS (user 'cube_reader', password 'cube_reader');

-- Локальная внешняя таблица, соответствующая представлению v_canteen_price_h_mean_cube в db2
-- Определяем схему столбцов вручную, чтобы не контактировать с удаленной БД при инициализации
CREATE FOREIGN TABLE IF NOT EXISTS v_canteen_price_h_mean_cube (
  dishtype_id integer,
  dishtype_name character varying(100),
  cook_id integer,
  cook_name character varying(100),
  harmonic_price_per_portion numeric,
  dish_names text
) SERVER cube_server_db2
  OPTIONS (schema_name 'public', table_name 'v_canteen_price_h_mean_cube');


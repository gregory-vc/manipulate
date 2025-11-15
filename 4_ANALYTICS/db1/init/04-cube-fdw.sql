CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER IF NOT EXISTS cube_server_db2
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'db2', port '5432', dbname 'db2');

CREATE USER MAPPING IF NOT EXISTS FOR CURRENT_USER
  SERVER cube_server_db2
  OPTIONS (user 'fdw_reader_db2', password 'fdw_reader_db2');

CREATE FOREIGN TABLE IF NOT EXISTS canteen_price_h_mean_cube (
  dishtype_id integer,
  dishtype_name character varying(100),
  cook_id integer,
  cook_name character varying(100),
  harmonic_price_per_portion numeric,
  dish_names text
) SERVER cube_server_db2
  OPTIONS (schema_name 'public', table_name 'canteen_price_h_mean_cube');

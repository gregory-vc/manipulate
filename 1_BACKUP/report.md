# Отчет по резервному копированию db1

## Описание предметной области
База данных описывает результаты полевых опытов сельскохозяйственного института, который изучает влияние предшественников и режимов ухода за почвой на урожайность зерновых культур в Новосибирской области. Для каждой культуры фиксируются поле, год, агротехнические условия и урожай, что позволяет анализировать эффективность технологий и подбирать оптимальные схемы севооборота. Система служит основой для отчетности, прогнозов и планирования ресурсов.

## Схема базы данных
```sql
CREATE TABLE cultures (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE predecessors (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE conditions (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE
);

CREATE TABLE experiments (
    id SERIAL PRIMARY KEY,
    year INT,
    field INT,
    culture_id INT REFERENCES cultures(id),
    predecessor_id INT REFERENCES predecessors(id),
    condition_id INT REFERENCES conditions(id),
    yield NUMERIC(5,2)
);
```

## Примеры запросов на вставку данных
```sql
INSERT INTO cultures (name) VALUES ('Горох'), ('Овёс'), ('Пшеница'), ('Ячмень');
INSERT INTO predecessors (name) VALUES ('Овёс'), ('Пар'), ('Пшеница'), ('Ячмень');
INSERT INTO conditions (name) VALUES ('Без травы'), ('С травой');
INSERT INTO experiments (year, field, culture_id, predecessor_id, condition_id, yield)
VALUES (2015, 1, 1, 1, 2, 19.10),
       (2015, 1, 4, 2, 1, 31.80),
       (2015, 2, 4, 1, 2, 22.00),
       (2015, 2, 1, 4, 2, 16.00);
```

Делаем дефолтное резервное копирование данных

./scripts/backup_default.sh
Writing default backup to 1_BACKUP/backups/db1_default.sql
Backup completed.

Проверяем какие данные содержатся в данный момент и выполняем обновление данных

./scripts/show_update_experiment.sh
BEGIN
 id | year | field | culture_id | predecessor_id | condition_id | yield 
----+------+-------+------------+----------------+--------------+-------
 14 | 2015 |     7 |          3 |              3 |            1 | 28.30
(1 row)

UPDATE 1
 id | year | field | culture_id | predecessor_id | condition_id | yield 
----+------+-------+------------+----------------+--------------+-------
 14 | 2025 |     7 |          3 |              3 |            1 | 28.30
(1 row)

COMMIT

Выполняем восстановление базы данных

make 2_restore_default
./scripts/restore_default.sh
Restoring db1 from /Users/ami/source/manipulate/1_BACKUP/backups/db1_default.sql
Restore completed.

Проверяем что изменение данных откатилось
make 8_show_experiment
./scripts/show_experiment.sh
 id | year | field | culture_id | predecessor_id | condition_id | yield 
----+------+-------+------------+----------------+--------------+-------
 14 | 2015 |     7 |          3 |              3 |            1 | 28.30
(1 row)
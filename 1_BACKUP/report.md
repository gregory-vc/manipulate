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

## Ход экспериментов по резервному копированию

Делаем резервное копирование данных в формате custom:

```text
/Applications/Xcode.app/Contents/Developer/usr/bin/make build
docker compose down -v && docker compose up -d --build
/Applications/Xcode.app/Contents/Developer/usr/bin/make 1_backup_custom
./scripts/backup_custom.sh db1_custom.dump
Waiting for db1 to become ready...
Writing custom-format backup to /Users/ami/source/manipulate/1_BACKUP/backups/db1_custom.dump
Backup completed.
```

После резервного копирования фиксируем текущее состояние строки и меняем год на 2025:

```text
/Applications/Xcode.app/Contents/Developer/usr/bin/make 7_show_update_experiment
./scripts/show_update_experiment.sh
Waiting for db1 to become ready...
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
```

Восстанавливаем базу из custom-бэкапа и убеждаемся, что год вернулся к исходному значению:

```text
/Applications/Xcode.app/Contents/Developer/usr/bin/make 2_restore_custom
./scripts/restore_custom.sh ./backups/db1_custom.dump
Waiting for db1 to become ready...
Restoring db1 from ./backups/db1_custom.dump
Restore completed.
/Applications/Xcode.app/Contents/Developer/usr/bin/make 8_show_experiment
./scripts/show_experiment.sh
Waiting for db1 to become ready...
 id | year | field | culture_id | predecessor_id | condition_id | yield 
----+------+-------+------------+----------------+--------------+-------
 14 | 2015 |     7 |          3 |              3 |            1 | 28.30
(1 row)
```

Выполняем plain-бэкапы с разными вариантами параметра `Sections`:

```text
/Applications/Xcode.app/Contents/Developer/usr/bin/make 3_backup_sections
./scripts/backup_plain_sections.sh
Waiting for db1 to become ready...
Dumping pre-data section
Dumping data section
Dumping post-data section
Section-specific backups are stored in /Users/ami/source/manipulate/1_BACKUP/backups/plain_sections
/Applications/Xcode.app/Contents/Developer/usr/bin/make 3_sections_pre
./scripts/backup_plain_sections.sh pre-data
Waiting for db1 to become ready...
Dumping pre-data section
Section-specific backups are stored in /Users/ami/source/manipulate/1_BACKUP/backups/plain_sections
/Applications/Xcode.app/Contents/Developer/usr/bin/make 3_sections_data
./scripts/backup_plain_sections.sh data
Waiting for db1 to become ready...
Dumping data section
Section-specific backups are stored in /Users/ami/source/manipulate/1_BACKUP/backups/plain_sections
/Applications/Xcode.app/Contents/Developer/usr/bin/make 3_sections_post
./scripts/backup_plain_sections.sh post-data
Waiting for db1 to become ready...
Dumping post-data section
Section-specific backups are stored in /Users/ami/source/manipulate/1_BACKUP/backups/plain_sections
```

Проверяем влияние настроек `Type of objects` (Only Schema и Only Data):

```text
/Applications/Xcode.app/Contents/Developer/usr/bin/make 4_backup_types
./scripts/backup_plain_types.sh
Waiting for db1 to become ready...
Dumping schema-only script
Dumping data-only script
Type-specific backups are stored in /Users/ami/source/manipulate/1_BACKUP/backups/plain_types
/Applications/Xcode.app/Contents/Developer/usr/bin/make 4_type_schema
./scripts/backup_plain_types.sh schema
Waiting for db1 to become ready...
Dumping schema-only script
Type-specific backups are stored in /Users/ami/source/manipulate/1_BACKUP/backups/plain_types
/Applications/Xcode.app/Contents/Developer/usr/bin/make 4_type_data
./scripts/backup_plain_types.sh data
Waiting for db1 to become ready...
Dumping data-only script
Type-specific backups are stored in /Users/ami/source/manipulate/1_BACKUP/backups/plain_types
```

Создаем резервную копию в формате `Directory` и выполняем восстановление:

```text
/Applications/Xcode.app/Contents/Developer/usr/bin/make 5_backup_directory
./scripts/backup_directory.sh
Waiting for db1 to become ready...
Creating directory-format backup at /Users/ami/source/manipulate/1_BACKUP/backups/directory/db1_directory_20251103_194226
[+] Copying 1/1
 ✔ postgres-db1 copy postgres-db1:/tmp/db1_directory_20251103_194226 to /Users/ami/source/manipulate/1_BACKUP/backups/directory/db1_directory_20251103_194226 Copied0.0s 
Directory backup stored at /Users/ami/source/manipulate/1_BACKUP/backups/directory/db1_directory_20251103_194226
/Applications/Xcode.app/Contents/Developer/usr/bin/make 6_restore_directory
./scripts/restore_directory.sh
Using latest directory backup: /Users/ami/source/manipulate/1_BACKUP/backups/directory/db1_directory_20251103_194226
Waiting for db1 to become ready...
Copying /Users/ami/source/manipulate/1_BACKUP/backups/directory/db1_directory_20251103_194226 into container path /tmp/db1_directory_20251103_194226
[+] Copying 1/1
 ✔ postgres-db1 copy /Users/ami/source/manipulate/1_BACKUP/backups/directory/db1_directory_20251103_194226 to postgres-db1:/tmp/db1_directory_20251103_194226 Copied0.0s 
Restoring db1 from directory backup
Directory restore completed.
```

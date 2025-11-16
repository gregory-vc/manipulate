# Репликация PostgreSQL: первичная и резервная инстанции

## Конфигурация_primary

### Сервис `postgres-primary`
- Собирается из `primary/Dockerfile`, где в образ копируются `init-primary.sh` и `02-CANTEENDISHES.sql`.
- Переменные окружения (`docker-compose.yml`) задают базу `canteen` и пользователя `canteen`.
- Скрипт `primary/init-primary.sh` выполняется один раз при инициализации и отвечает за конфигурацию:

```sql
-- создание пользователя для репликации
CREATE ROLE repl_user WITH REPLICATION LOGIN PASSWORD 'repl_password';

-- настройка параметров через ALTER SYSTEM
ALTER SYSTEM SET listen_addresses = '*';
ALTER SYSTEM SET wal_level = 'replica';
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET max_replication_slots = 10;
ALTER SYSTEM SET wal_keep_size = '1GB';
ALTER SYSTEM SET archive_mode = 'on';
ALTER SYSTEM SET archive_command = 'test ! -f /var/lib/postgresql/archive/%f && cp %p /var/lib/postgresql/archive/%f';

-- правила pg_hba.conf (по умолчанию допускаем сети 172.16.0.0/12 и 192.168.0.0/16)
host replication repl_user <subnet> scram-sha-256
host all all <subnet> scram-sha-256
host all all 127.0.0.1/32 scram-sha-256
```

### Сервис `postgres-replica`
- Собирается из `replica/Dockerfile`, где точкой входа служит `replica-entrypoint.sh`.
- Скрипт реплики выполняет следующую последовательность:
  1. Ждёт готовности primary (`pg_isready`).
  2. Полностью очищает `PGDATA` и делает `pg_basebackup` с ключами `-Fp -Xs -P -R -C -S replica_slot`.
  3. Запускает стандартный entrypoint с параметрами `listen_addresses=*` и `hot_standby=on`.
- Окружение (`docker-compose.yml`) передаёт координаты primary, логин/пароль `repl_user` и имя слота `replica_slot`.

## Проверка `make run`
Вывод команды `make run` фиксирует состояние репликации и демонстрирует распространение изменений на строке `canteendishes.dishid=1`.

### 1. Состояние потоков на первичном сервере
Запрос:
```sql
SELECT pid, application_name, state, sync_state, write_lsn, flush_lsn, replay_lsn
FROM pg_stat_replication;
```
Вывод:
```
 pid | application_name |   state   | sync_state | write_lsn | flush_lsn | replay_lsn 
-----+------------------+-----------+------------+-----------+-----------+------------
 252 | walreceiver      | streaming | async      | 0/308C450 | 0/308C450 | 0/308C450
(1 row)
```

### 2. Статус реплики
Запрос:
```sql
SELECT pg_is_in_recovery();
```
Вывод:
```
 pg_is_in_recovery 
-------------------
 t
(1 row)
```

### 3. Проверка согласованности данных
Запрос (для чтения):
```sql
SELECT price::text FROM canteendishes WHERE dishid=1;
```
Вывод до обновления:
```
Первичный сервер до обновления : 23.00
Сервер-реплика до обновления : 23.00
Значения совпадают до обновления.
```

Запрос (обновление на primary):
```sql
UPDATE canteendishes SET price = price + 1 WHERE dishid=1 RETURNING price::text;
```
Результат обновления:
```
Новое значение на первичном сервере: 24.00
Изменено строк: 1
```

Состояние после задержки 2 секунды (тот же SELECT):
```
Первичный сервер после обновления : 24.00
Сервер-реплика после обновления : 24.00
Репликация подтверждена для выбранной строки.
```

Таким образом, репликация активна, реплика находится в режиме `pg_is_in_recovery() = true`, а данные успешно распространяются на резервный сервер.

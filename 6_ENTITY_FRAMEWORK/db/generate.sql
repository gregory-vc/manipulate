\set ON_ERROR_STOP on
\pset format unaligned
\pset tuples_only on

-- Берём оригинальный скрипт из репозитория (он смонтирован как /workspace)
\i /workspace/db/init/03-generator.sql

-- Выгрузить C# классы сущностей в файл в корень репозитория
\o /workspace/Entities.cs
SELECT current_setting('myapp.class_definitions');
\o

-- Выгрузить DbContext в отдельный файл в корень репозитория
\o /workspace/DbContext.cs
SELECT current_setting('myapp.context_definition');
\o

DO $$
DECLARE
    -- Настраиваемые параметры
    namespace_name TEXT := 'MyProjectNamespace';  -- Пространство имен C#
    schema_name TEXT := 'public';                 -- Схема БД
    context_name TEXT := UPPER(SUBSTRING(schema_name, 1, 1)) || LOWER(SUBSTRING(schema_name, 2)) || 'DbContext'; -- Контекст
    class_definitions TEXT := '';
    context_definition TEXT := '';
BEGIN
    -- Генерация классов и сохранение в сессионную переменную
    WITH pk_columns AS (
        SELECT 
            kcu.table_name,
            kcu.table_schema,
            STRING_AGG(
                'nameof(' || 
                UPPER(SUBSTRING(kcu.column_name, 1, 1)) || 
                LOWER(SUBSTRING(kcu.column_name, 2)) || 
                ')', 
                ', ' 
                ORDER BY kcu.ordinal_position
            ) AS pk_names
        FROM information_schema.key_column_usage kcu
        JOIN information_schema.table_constraints tc
            ON kcu.constraint_name = tc.constraint_name
            AND kcu.table_name = tc.table_name
            AND kcu.table_schema = tc.table_schema
        WHERE tc.constraint_type = 'PRIMARY KEY'
        GROUP BY kcu.table_name, kcu.table_schema
    ),
    classes AS (
        SELECT 
            E'\t[Table("'||c.TABLE_NAME||E'")]\n' ||
            CASE 
                WHEN t.table_type = 'VIEW' THEN E'\t[Keyless]\n'
                ELSE COALESCE(
                    (SELECT E'\t[PrimaryKey(' || pk_names || E')]\n' 
                    FROM pk_columns 
                    WHERE table_name = c.TABLE_NAME 
                    AND table_schema = c.TABLE_SCHEMA),
                    ''
                )
            END ||
            E'\tpublic class ' || UPPER(SUBSTRING(c.TABLE_NAME, 1, 1)) || LOWER(SUBSTRING(c.TABLE_NAME, 2)) || 
            E'\n\t{\n' || 
            STRING_AGG(
                CASE 
                    WHEN c.COLUMN_NAME <> UPPER(SUBSTRING(c.COLUMN_NAME, 1, 1)) || LOWER(SUBSTRING(c.COLUMN_NAME, 2)) THEN
                        E'\t\t[Column("' || COLUMN_NAME || E'")]\n'
                    ELSE ''
                END ||
                CASE 
                    WHEN c.COLUMN_NAME IN (
                        SELECT kcu.column_name 
                        FROM information_schema.key_column_usage kcu
                        JOIN information_schema.table_constraints tc
                        ON kcu.constraint_name = tc.constraint_name
                        AND kcu.table_name = tc.table_name
                        AND kcu.table_schema = tc.table_schema
                        WHERE tc.constraint_type = 'PRIMARY KEY'
                        AND kcu.table_name = c.TABLE_NAME
                        AND kcu.table_schema = c.TABLE_SCHEMA
                    ) THEN
                        CASE 
                            WHEN c.COLUMN_DEFAULT LIKE 'nextval%' OR c.DATA_TYPE IN ('serial', 'bigserial') OR c.is_identity='YES' THEN
                                E'\t\t[DatabaseGenerated(DatabaseGeneratedOption.Identity)]\n\t\tpublic '
                            ELSE
                                E'\t\tpublic '
                        END
                    ELSE E'\t\tpublic '
                END ||
                CASE c.DATA_TYPE
                    WHEN 'integer' THEN 'int'
                    WHEN 'bigint' THEN 'long'
                    WHEN 'smallint' THEN 'short'
                    WHEN 'numeric' THEN 'decimal'
                    WHEN 'real' THEN 'float'
                    WHEN 'double precision' THEN 'double'
                    WHEN 'boolean' THEN 'bool'
                    WHEN 'character varying' THEN 'string'
                    WHEN 'text' THEN 'string'
                    WHEN 'timestamp without time zone' THEN 'DateTime'
                    WHEN 'timestamp with time zone' THEN 'DateTimeOffset'
                    WHEN 'date' THEN 'DateTime'
                    WHEN 'time without time zone' THEN 'TimeSpan'
                    WHEN 'time with time zone' THEN 'DateTimeOffset'
                    WHEN 'uuid' THEN 'Guid'
                    WHEN 'jsonb' THEN 'string'
                    WHEN 'json' THEN 'string'
                    WHEN 'bytea' THEN 'byte[]'
                    ELSE 'object'
                END ||
                CASE 
                    WHEN c.IS_NULLABLE = 'YES' AND c.DATA_TYPE NOT IN ('character varying', 'text', 'json', 'jsonb', 'bytea') 
                    THEN '?' 
                    ELSE '' 
                END ||
                ' ' || UPPER(SUBSTRING(c.COLUMN_NAME, 1, 1)) || LOWER(SUBSTRING(c.COLUMN_NAME, 2)) || ' { get; set; }', 
                E'\n\n' ORDER BY c.ORDINAL_POSITION
            ) || 
            E'\n\t}\n' AS class_text
        FROM INFORMATION_SCHEMA.COLUMNS c
        JOIN INFORMATION_SCHEMA.TABLES t
            ON c.TABLE_NAME = t.table_name
            AND c.TABLE_SCHEMA = t.table_schema
        WHERE c.table_schema = schema_name
        AND t.table_type IN ('BASE TABLE', 'VIEW')
        AND c.table_name NOT LIKE 'pg_%'
        AND c.table_name NOT LIKE 'sql_%'
        AND c.table_name NOT LIKE 'citus_%'
        GROUP BY c.TABLE_NAME, c.TABLE_SCHEMA, t.table_type
    )
    SELECT E'using System;\n' ||
           E'using System.ComponentModel.DataAnnotations;\n' ||
           E'using System.ComponentModel.DataAnnotations.Schema;\n\n' ||
           E'namespace ' || namespace_name || E'\n{\n' ||
           STRING_AGG(class_text, E'\n') || 
           E'}\n' INTO class_definitions 
    FROM classes;
    EXECUTE 'SET myapp.class_definitions = ' || quote_literal(class_definitions);

    -- Генерация контекста и сохранение в сессионную переменную
    SELECT 
        E'using System;\n' ||
        E'using Microsoft.EntityFrameworkCore;\n\n' ||
        E'namespace ' || namespace_name || E'\n{\n' ||
        E'\tpublic class ' || context_name || E' : DbContext\n' || E'\t{\n' ||
        E'\t\tpublic ' || context_name || E'(DbContextOptions<' || context_name || E'> options) : base(options) { }\n' ||
        STRING_AGG(
            E'\t\tpublic DbSet<' || 
            UPPER(SUBSTRING(TABLE_NAME, 1, 1)) || LOWER(SUBSTRING(TABLE_NAME, 2)) || 
            E'> ' || TABLE_NAME || E' { get; set; }',
            E'\n'
        ) ||
        E'\n\n' ||
        E'\t\tprotected override void OnModelCreating(ModelBuilder modelBuilder)\n' ||
        E'\t\t{\n' ||
        E'\t\t\t// Конфигурации моделей можно добавить здесь\n' ||
        E'\t\t}\n' ||
        E'\t}\n}\n' INTO context_definition
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE table_schema = schema_name
    GROUP BY table_schema;
    EXECUTE 'SET myapp.context_definition = ' || quote_literal(context_definition);
END $$;

-- Результаты
SELECT '-- Классы сущностей --' AS comment, '' AS code
UNION ALL
SELECT '', current_setting('myapp.class_definitions')
UNION ALL
SELECT '-- Контекст БД --', '' 
UNION ALL
SELECT '', current_setting('myapp.context_definition');
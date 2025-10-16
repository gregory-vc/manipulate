CREATE TABLE fields (
    id           SERIAL PRIMARY KEY,
    code         TEXT UNIQUE NOT NULL,         -- внутренний код/номер поля
    name         TEXT,                          -- человекочитаемое имя
    area_ha      NUMERIC(7,2),                  -- площадь, га
    lat          NUMERIC(9,6),                  -- широта
    lon          NUMERIC(9,6),                  -- долгота
    soil_type    TEXT,                          -- тип почвы (чернозём, суглинок и т.п.)
    soil_texture TEXT,                          -- грансостав (песчаная, суглинистая…)
    ph           NUMERIC(3,1),                  -- pH (актуальный/референсный)
    humus_pct    NUMERIC(4,2),                  -- % гумуса
    irrigated    BOOLEAN DEFAULT FALSE,         -- есть ли орошение
    notes        TEXT
);
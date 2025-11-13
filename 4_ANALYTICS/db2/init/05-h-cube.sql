CREATE OR REPLACE FUNCTION h_accum
(
    state numeric[],
    value numeric
)
RETURNS numeric[] AS $$
BEGIN
    IF value IS NULL THEN
        RETURN state;
    END IF;

    IF value = 0 THEN
        RAISE EXCEPTION 'Harmonic mean is undefined for zero values';
    END IF;

    state[1] := state[1] + 1 / value; -- Накопленная сумма обратных значений
    state[2] := state[2] + 1;         -- Количество элементов

    RETURN state;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION h_final(state numeric[])
RETURNS numeric AS $$
BEGIN
    IF state[2] = 0 OR state[1] = 0 THEN
        RETURN NULL; -- Нет данных
    END IF;

    RETURN state[2] / state[1];
END;
$$ LANGUAGE plpgsql;

CREATE AGGREGATE h_mean(numeric)
(
    SFUNC = h_accum,

    -- Тип состояния (массив из двух элементов)
    STYPE = numeric[],

    FINALFUNC = h_final,
    INITCOND = '{0,0}'
);

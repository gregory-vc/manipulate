-- Представление, объединяющее локальные поля и внешние эксперименты (db1)
CREATE OR REPLACE VIEW public.v_field_experiments AS
SELECT
  f.code                  AS field_code,
  f.name                  AS field_name,
  f.area_ha,
  f.lat,
  f.lon,
  c.name                  AS culture_name,
  p.name                  AS predecessor_name,
  cond.name               AS condition_name,
  e.year,
  e.yield
FROM public.experiments e
JOIN public.cultures     c    ON c.id = e.culture_id
JOIN public.predecessors p    ON p.id = e.predecessor_id
JOIN public.conditions   cond ON cond.id = e.condition_id
JOIN public.fields       f    ON f.code::int = e.field;

GRANT SELECT ON public.v_field_experiments TO PUBLIC;


--
-- Аналитическая задача
-- ---------------------
-- Определить «эффективную» среднюю цену порции по поварам и типам блюд,
-- если бюджет распределяется равномерно между позициями в группе.
-- В таком сценарии корректным агрегатором для цен (руб/порция) является
-- гармоническое среднее, так как оно соответствует ситуации равного бюджета:
--   средняя_цена = N / Σ(1/price_i)
-- Это эквивалентно «за одинаковые деньги сколько порций в среднем получим».
--
-- Что даёт CUBE(dishtype, cookid):
-- - (dishtype, cookid): эффективная средняя цена по позициям конкретного повара в типе.
-- - (dishtype, NULL): эффективная средняя цена по всем поварам в типе при равном бюджете на повара/позицию.
-- - (NULL, cookid): эффективная средняя цена по всем типам у повара при равном бюджете на тип/позицию.
-- - (NULL, NULL): эффективная средняя цена по всему меню при равном бюджете на позицию.
--
-- Важно: арифметическое среднее уместно при равном числе порций на позицию;
-- гармоническое — при равном бюджете на позицию. Здесь используем второе.

DROP MATERIALIZED VIEW IF EXISTS canteen_price_h_mean_cube;

CREATE MATERIALIZED VIEW canteen_price_h_mean_cube AS
SELECT
    d.dishtype                                       AS dishtype_id,
    CASE WHEN GROUPING(d.dishtype) = 0
         THEN MIN(dt.name)
    END                                              AS dishtype_name,
    d.cookid                                         AS cook_id,
    CASE WHEN GROUPING(d.cookid) = 0
         THEN MIN(p.name)
    END                                              AS cook_name,
    h_mean(d.price)                                  AS harmonic_price_per_portion,
    CASE
        WHEN GROUPING(d.dishtype)=0 AND GROUPING(d.cookid)=0
        THEN string_agg(DISTINCT d.dishname, ', ' ORDER BY d.dishname)
    END                                              AS dish_names
FROM canteendishes d
LEFT JOIN dishtype dt ON dt.dishtype = d.dishtype
LEFT JOIN persons  p  ON p.personid = d.cookid
WHERE d.price IS NOT NULL
  AND d.price > 0
GROUP BY CUBE (d.dishtype, d.cookid);

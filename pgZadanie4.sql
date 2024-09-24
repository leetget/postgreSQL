-- 4. составить сводный отчет по суммарной стоимости товаров проданных в городе 'town1'
SELECT
    EXTRACT(YEAR FROM sales.time) AS year,
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 1 THEN sales.cost END),0) AS "1",--январь
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 2 THEN sales.cost END),0)AS "2",--февраль
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 3 THEN sales.cost END),0) AS "3",--март
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 4 THEN sales.cost END),0) AS "4",--апрель
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 5 THEN sales.cost END), 0) AS "5",--май
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 6 THEN sales.cost END), 0) AS "6",--июнь
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 7 THEN sales.cost END), 0) AS "7",--июль
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 8 THEN sales.cost END), 0) AS "8",--август
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 9 THEN sales.cost END), 0) AS "9",--сентябрь
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 10 THEN sales.cost END), 0) AS "10",--октябрь
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 11 THEN sales.cost END), 0) AS "11",--ноябрь
    COALESCE(SUM(CASE WHEN EXTRACT(MONTH FROM sales.time) = 12 THEN sales.cost END), 0) AS "12"--декабрь
FROM
    sales 
JOIN
    dep  ON sales.dep_id = dep.id
WHERE
    dep.city = 'town1'
    AND EXTRACT(YEAR FROM sales.time) BETWEEN 2018 AND EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY
    year
ORDER BY
    year;
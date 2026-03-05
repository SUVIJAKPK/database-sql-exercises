WITH shop AS (
    SELECT
        p.pname,
        p.pprice,
        SUM(ps.quantity_sold) AS total_sales
    FROM product p
    JOIN product_sales ps ON p.pid = ps.pid
    WHERE ps.sale_date BETWEEN '2022-01-01 00:00' AND '2025-01-01 00:00'
    GROUP BY p.pname, p.pprice
    HAVING SUM(ps.quantity_sold) <= 100
)

SELECT s.pname, s.pprice, s.total_sales
FROM shop s
ORDER BY s.total_sales DESC, s.pprice ASC, s.pname ASC
LIMIT 3;
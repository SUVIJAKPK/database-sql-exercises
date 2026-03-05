SELECT
    EXTRACT(YEAR FROM o.order_date) AS order_year,
    ROUND(SUM(od.quantity * p.unit_price * od.discount) :: NUMERIC , 2) AS discount_amount
FROM orders o
JOIN order_details od ON o.oid = od.oid
JOIN products p ON od.pid = p.pid
GROUP BY EXTRACT(YEAR FROM o.order_date)
ORDER BY EXTRACT(YEAR FROM o.order_date) DESC



WITH top_spen AS (
    SELECT
        c.id,
        c.name,
        SUM(o.amount * d.price) AS total
    FROM customers c
    JOIN orders o ON c.id = o.c_id
    JOIN desserts d ON o.d_id = d.id
    GROUP BY c.id, c.name
)

SELECT 
    ts.name,
    ts.total
FROM top_spen ts
WHERE ts.total = (
    SELECT
        MAX(hs.total)
    FROM top_spen hs
)
ORDER BY ts.id ASC
LIMIT 1;



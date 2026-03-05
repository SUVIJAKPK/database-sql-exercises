WITH purchase AS (
    SELECT
        c.first_name,
        c.cus_id,
        COUNT(i.id) AS count_in,
        SUM(i.total_spent) AS ts
    FROM customer c
    JOIN invoice i ON c.cus_id = i.cus_id
    GROUP BY c.first_name, c.cus_id
)

SELECT 
    p.first_name
FROM purchase p
WHERE p.ts = (
    SELECT
        MAX(q.ts)
    FROM purchase q
)
ORDER BY p.count_in ASC, p.cus_id ASC
LIMIT 1;



-- WITH trend AS (
-- 	SELECT
-- 		pcategory,
-- 		COUNT(pid) as count_pid
-- 	FROM product 
-- 	GROUP BY pcategory
-- ), pidmax AS (
-- 	SELECT
-- 		pcategory
-- 	FROM trend
-- 	WHERE count_pid = (
-- 		SELECT
-- 			MAX(count_pid)
-- 		FROM trend
-- 	)
-- ), avg_price AS (
-- 	SELECT 
-- 		AVG(pprice) AS avg_p
-- 	FROM product p, pidmax pid
-- 	WHERE p.pcategory = pid.pcategory
-- 	GROUP BY p.pcategory
-- )

-- SELECT 
-- 	DISTINCT(c.cname)
-- FROM customer c
-- JOIN placement pl ON c.cid = pl.cid
-- JOIN product pro ON pl.pid = pro.pid
-- WHERE pro.pprice > (
-- 	SELECT
-- 		mxx.avg_p
-- 	FROM avg_price mxx
-- )
-- ORDER BY c.cname ASC;



WITH category_stat AS (
    SELECT
        pcategory,
        COUNT(pid) AS count_pid,
        AVG(pprice) OVER ( PARTITION BY pcategory ) AS avg_price,
        RANK() OVER ( ORDER BY COUNT(pid) DESC ) AS rnk
    FROM product
    GROUP BY pcategory, pprice
)

SELECT 
	DISTINCT c.cname
FROM customer c
JOIN placement pl 
    ON c.cid = pl.cid
JOIN product p 
    ON pl.pid = p.pid
WHERE p.pprice > (
    SELECT 
		avg_price
    FROM category_stat
    WHERE rnk = 1
    FETCH FIRST 1 ROW ONLY
)
ORDER BY c.cname ASC;

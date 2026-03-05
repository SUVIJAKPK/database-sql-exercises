-- WITH findmax AS (
-- 	SELECT 
-- 		a.aname, 
-- 		a.aid, 
-- 		t.tname, 
-- 		COUNT(s.cid) AS con_count
-- 	FROM author a
-- 	JOIN task t ON a.aid = t.aid
-- 	JOIN submit s ON t.tid = s.tid
-- 	WHERE s.score = 100
-- 	GROUP BY a.aname, a.aid, t.tname
-- ), max_value AS (
-- 	SELECT 
-- 		MAX(fd.con_count) AS maxx
-- 	FROM findmax fd
-- )

-- SELECT 
-- 	fd.aname, 
-- 	fd.tname
-- FROM findmax fd, max_value mx
-- WHERE fd.con_count = mx.maxx
-- ORDER BY fd.aid ASC

SELECT 
    aname,
    tname
FROM (
    SELECT 
        a.aid,
        a.aname,
        t.tname,
        COUNT(s.cid) AS con_count,
        RANK() OVER ( ORDER BY COUNT(s.cid) DESC ) AS rnk
    FROM author a
    JOIN task t 
        ON a.aid = t.aid
    JOIN submit s 
        ON t.tid = s.tid
    WHERE s.score = 100
    GROUP BY a.aid, a.aname, t.tname
) ranked
WHERE rnk = 1
ORDER BY aid ASC;

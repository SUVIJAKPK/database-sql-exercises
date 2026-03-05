-- WITH alldate AS (
-- 	SELECT 
-- 		DISTINCT ddate
-- 	FROM expense
-- ), allpeople AS (
-- 	SELECT 
-- 		DISTINCT pname
-- 	FROM expense
-- ), mergeall AS (
-- 	SELECT 
-- 		ad.ddate, 
-- 		ap.pname, 
-- 		COALESCE(SUM(e.amt),0) AS minsum
-- 	FROM alldate ad
-- 	CROSS JOIN allpeople ap
-- 	LEFT JOIN expense e ON ad.ddate = e.ddate AND ap.pname = e.pname
-- 	GROUP BY ad.ddate, ap.pname
-- )

-- SELECT 
-- 	mg.ddate, 
-- 	mg.pname
-- FROM mergeall mg
-- WHERE mg.minsum = (
-- 	SELECT 
-- 		MIN(gg.minsum) 
-- 	FROM mergeall gg
-- 	WHERE gg.ddate = mg.ddate
-- )
-- ORDER BY mg.ddate ASC, mg.pname ASC 





SELECT 
    ddate,
    pname
FROM (
    SELECT 
        d.ddate,
        p.pname,
        COALESCE(SUM(e.amt), 0) AS total_amt,
        RANK() OVER (
            PARTITION BY d.ddate
            ORDER BY COALESCE(SUM(e.amt), 0) ASC
        ) AS rnk
    FROM (SELECT DISTINCT ddate FROM expense) d
    CROSS JOIN (SELECT DISTINCT pname FROM expense) p
    LEFT JOIN expense e
        ON d.ddate = e.ddate
       AND p.pname = e.pname
    GROUP BY d.ddate, p.pname
) t
WHERE rnk = 1
ORDER BY ddate, pname;

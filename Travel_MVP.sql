SELECT e.ddate, e.pname
FROM expense e
GROUP BY e.ddate, e.pname
HAVING SUM(e.amt) = (
	SELECT MAX(daily_sum)
	FROM (
		SELECT SUM(a.amt) AS daily_sum
		FROM expense a
		WHERE a.ddate = e.ddate
		GROUP BY a.pname
	) abc
)
ORDER BY e.ddate ASC , e.pname ASC
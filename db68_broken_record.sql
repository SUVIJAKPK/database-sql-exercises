SELECT 
	COALESCE(c.studentid, u.studentid) AS studentid,
	COALESCE(u.pname, c.pname) as pname,
	c.cname
FROM userinfo u 
JOIN clubreg c ON u.pname = c.pname OR u.studentid = c.studentid
ORDER BY studentid DESC



-- CROSS JOIN clubreg c
-- WHERE u.pname = c.pname OR u.studentid = c.studentid

-- WHERE COALESCE(c.studentid, u.studentid) IS NOT NULL 
-- 	AND COALESCE(u.pname, c.pname) IS NOT NULL
-- 	AND c.cname IS NOT NULL

-- FULL OUTER JOIN clubreg c ON u.pname = c.pname AND u.studentid = c.studentid
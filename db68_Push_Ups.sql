SELECT
  u.name
FROM users u
JOIN workout wk ON u.ssn = wk.ssn
WHERE u.sex LIKE 'F' AND (u.age BETWEEN 22 AND 60) AND wk.push_count >= 40
ORDER BY wk.push_count DESC, u.ssn ASC
LIMIT 5;

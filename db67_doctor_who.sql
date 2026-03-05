SELECT d.dname as mor_name
FROM doctor d
LEFT JOIN work_for wf ON d.d_id = wf.d_id
WHERE wf.d_id IS NULL AND d.dname LIKE 'C%'
ORDER BY d.dage DESC, d.d_id ASC
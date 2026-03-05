SELECT
  DISTINCT(po.name),
  po.era,
  po.birth_year
FROM poets po
JOIN poems ps ON po.poet_id = ps.poet_id
WHERE (ps.written_year BETWEEN 1800 AND 1900) 
  AND (ps.lines >= 4) 
  AND (ps.mood ILIKE 'sad%' OR ps.mood ILIKE 'love%') 
  AND (ps.title ILIKE '%lonely%')
ORDER BY po.name ASC, po.era ASC, po.birth_year ASC
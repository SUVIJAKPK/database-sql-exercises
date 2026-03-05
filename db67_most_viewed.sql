WITH major AS (
  SELECT
    m.mid,
    m.title,
    COUNT(c.cid) AS total_views
  FROM movie m
  JOIN customer c ON m.mid = c.mid
  GROUP BY m.mid, m.title
)

SELECT
  ma.mid,
  ma.title,
  ma.total_views
FROM major ma
WHERE ma.total_views = (
  SELECT
    MAX(k.total_views)
  FROM major k
)
ORDER BY ma.title ASC
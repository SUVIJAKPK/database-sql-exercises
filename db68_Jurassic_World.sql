WITH dinosorrr AS (
    SELECT 
        d.dino_name, 
        d.dino_type, 
        SUM(d.amount) AS dino_count
    FROM dinosaurs d
    GROUP BY d.dino_name, d.dino_type
)

SELECT ds.dino_name, ds.dino_type, ds.dino_count AS total_amount
FROM dinosorrr ds
WHERE ds.dino_count = (
    SELECT MAX(dr.dino_count)
    FROM dinosorrr dr
)
ORDER BY ds.dino_count DESC, ds.dino_type ASC, ds.dino_name ASC
LIMIT 1;
SELECT 
    name,
    unit_price
FROM product
WHERE (category_name = 'food' OR category_name = 'drink') AND unit_price > 2000
ORDER BY unit_price DESC
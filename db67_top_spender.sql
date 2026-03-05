SELECT 
    u.name, 
    SUM(p.price * o.quantity) AS total_price
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN products p ON o.product_id = p.id
GROUP BY u.id, u.name
ORDER BY total_price DESC, u.name ASC
LIMIT 1;
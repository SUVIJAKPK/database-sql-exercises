select 
    c.postal_code, 
    SUM(ol.o_quantity * p.standard_price) AS total_payment
from customer c
join ordert o ON c.c_id = o.c_id
join order_line ol ON o.o_id = ol.o_id
join product p ON ol.p_id = p.p_id
GROUP BY c.postal_code
HAVING SUM(ol.o_quantity * p.standard_price) > 0
ORDER BY c.postal_code ASC;










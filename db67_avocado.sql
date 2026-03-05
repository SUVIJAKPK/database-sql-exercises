SELECT 
  id, 
  customer, 
  order_date,
  delivery_date, 
  (delivery_date - order_date) as days_late
FROM purchase_orders
WHERE (delivery_date - order_date) > 5
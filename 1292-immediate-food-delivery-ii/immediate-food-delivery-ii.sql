/* Write your T-SQL query statement below */


SELECT
    ROUND(100.0*(SUM(CASE WHEN Delivery.order_date = Delivery.customer_pref_delivery_date THEN 1 ELSE 0 END)) 
    / 
    COUNT(*),2)
    AS immediate_percentage
FROM Delivery
INNER JOIN (
    SELECT 
        d.customer_id
        ,MIN(d.order_date) AS first_order
    FROM Delivery AS d
    GROUP BY d.customer_id
    ) AS m
ON Delivery.customer_id = m.customer_id
AND Delivery.order_date=m.first_order
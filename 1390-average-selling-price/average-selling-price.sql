/* Write your T-SQL query statement below */
SELECT p.product_id
        ,ROUND(COALESCE(SUM(CAST(p.price*u.units AS FLOAT)) / SUM(CAST(u.units AS FLOAT)), 0),2) AS average_price
FROM prices as p
LEFT JOIN UnitsSold as u
ON p.product_id = u.product_id AND u.purchase_date>=p.start_date AND u.purchase_date<=p.end_date
GROUP BY p.product_id
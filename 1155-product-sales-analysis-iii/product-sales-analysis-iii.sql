# Write your MySQL query statement below

WITH product_first_year_sold AS (
    SELECT s.product_id
            ,MIN(s.year) as first_year
    FROM Sales as s
    GROUP BY s.product_id
)

SELECT s.product_id
        ,fy.first_year
        ,s.quantity
        ,s.price
FROM Sales as s
INNER JOIN product_first_year_sold as fy
ON fy.first_year = s.year AND fy.product_id = s.product_id

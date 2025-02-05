# Write your MySQL query statement below
WITH cte AS (
    SELECT  p.product_id,
            FIRST_VALUE(p.new_price) OVER (PARTITION BY p.product_id ORDER BY p.change_date DESC) AS price,
            p.first_row_flag
    FROM (
        SELECT p0.product_id,
                p0.new_price,
                p0.change_date,
                0 AS first_row_flag 
        FROM Products AS p0
        WHERE DATE('2019-08-16') >= p0.change_date
        UNION # Union for default value of 10
        SELECT DISTINCT p1.product_id, 
                10 AS price,
                DATE('0001-01-01') AS change_date,
                1 AS first_row_flag
        FROM Products as p1
    ) as p
)

SELECT cte.product_id,
        cte.price
FROM cte
WHERE cte.first_row_flag


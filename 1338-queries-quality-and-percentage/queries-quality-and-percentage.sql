/* Write your T-SQL query statement below */
SELECT 
        q.query_name
        ,ROUND(AVG(1.0*q.rating/q.position)
                ,2) AS quality
        ,ROUND(100*SUM(CASE WHEN q.rating<3 THEN 1.0 ELSE 0 END) / COUNT(q.query_name)
                ,2) AS poor_query_percentage
FROM Queries AS q
GROUP BY q.query_name
/* Write your T-SQL query statement below */
SELECT r.contest_id
        ,ROUND(100*(COUNT(r.user_id))/(SELECT 1.0*COUNT(*) FROM Users),2) AS "percentage"
FROM Register as r
GROUP BY r.contest_id
ORDER BY "percentage" DESC, r.contest_id ASC
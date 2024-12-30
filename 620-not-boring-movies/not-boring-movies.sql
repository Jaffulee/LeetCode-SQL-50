/* Write your T-SQL query statement below */
SELECT *
FROM Cinema
WHERE NOT RIGHT(Cinema.id,1) IN (0,2,4,6,8) AND Cinema.description <> 'boring'
ORDER BY Cinema.rating DESC
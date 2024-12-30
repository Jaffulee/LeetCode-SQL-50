/* Write your T-SQL query statement below */
SELECT *
FROM Cinema
WHERE NOT Cinema.id%2 = 0 AND Cinema.description <> 'boring'
ORDER BY Cinema.rating DESC
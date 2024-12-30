/* Write your T-SQL query statement below */
SELECT MIN(E2.name) AS "name"
FROM Employee AS E1
INNER JOIN Employee AS E2
ON E1.managerId = E2.id
GROUP BY E2.id
HAVING COUNT(E2.id)>=5
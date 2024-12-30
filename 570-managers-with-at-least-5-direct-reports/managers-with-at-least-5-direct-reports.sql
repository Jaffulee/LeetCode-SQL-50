/* Write your T-SQL query statement below */
SELECT E2.name
FROM Employee AS E1
INNER JOIN Employee AS E2
ON E1.managerId = E2.id
GROUP BY E2.id, E2.name
HAVING COUNT(E2.id)>=5
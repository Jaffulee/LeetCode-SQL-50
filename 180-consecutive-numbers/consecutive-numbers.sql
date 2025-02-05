# Write your MySQL query statement below
SELECT DISTINCT l0.num AS ConsecutiveNums
FROM Logs AS l0
INNER JOIN Logs AS l2
ON l0.id = l2.id - 2 AND l0.num = l2.num
INNER JOIN Logs as l1
ON l0.id = l1.id - 1 AND l0.num = l1.num
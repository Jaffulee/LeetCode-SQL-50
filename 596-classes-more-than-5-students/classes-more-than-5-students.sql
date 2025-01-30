# Write your MySQL query statement below

SELECT c.class
FROM Courses as c
GROUP BY c.class
HAVING COUNT(c.student)>4
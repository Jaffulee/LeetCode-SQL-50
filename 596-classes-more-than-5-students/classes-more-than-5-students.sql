# Write your MySQL query statement below
SELECT c1.class
FROM (
SELECT c.class
        ,COUNT(c.student) as cnt
FROM Courses as c
GROUP BY c.class
HAVING cnt>4) AS c1
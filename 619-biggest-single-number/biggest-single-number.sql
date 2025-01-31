# Write your MySQL query statement below
SELECT MAX(f.num) AS num
FROM (
    SELECT n.num
    FROM MyNumbers AS n
    GROUP BY n.num
    HAVING COUNT(n.num)=1
) AS f
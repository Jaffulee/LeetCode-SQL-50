# Write your MySQL query statement below
SELECT DISTINCT l.num AS ConsecutiveNums
FROM (
    SELECT l1.num,
            l1.num = LEAD(l1.num) OVER (ORDER BY l1.id) AND l1.num = LEAD(l1.num,2) OVER (ORDER BY l1.id) AS consecutive_flag
    FROM Logs AS l1
) AS l
WHERE l.consecutive_flag

-- select lead(num) over (partition by lol order by id),lead(num,2) over (order by id), id,num from 




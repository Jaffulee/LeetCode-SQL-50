# Write your MySQL query statement below
WITH numberofdpt AS (
    SELECT e.employee_id,
            COUNT(*) as num
    FROM Employee as e
    GROUP BY e.employee_id
)

SELECT e.employee_id,
        e.department_id
FROM Employee as e
INNER JOIN numberofdpt as n
ON e.employee_id = n.employee_id
WHERE e.primary_flag = 'Y' OR n.num = 1

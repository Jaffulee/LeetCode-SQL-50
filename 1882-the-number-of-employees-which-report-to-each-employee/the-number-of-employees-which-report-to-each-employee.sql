# Write your MySQL query statement below
SELECT e.employee_id,
        MAX(e.name) as name,
        COUNT(*) as reports_count,
        ROUND(AVG(e0.age)) as average_age
FROM Employees as e
INNER JOIN Employees as e0
ON e0.reports_to = e.employee_id
GROUP BY e.employee_id
ORDER BY e.employee_id
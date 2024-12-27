/* Write your T-SQL query statement below */
select Employee.name
        ,Bonus.bonus
FROM Employee
LEFT JOIN Bonus
ON Employee.empId = Bonus.empId
WHERE Bonus.bonus<1000 OR Bonus.empID IS NULL

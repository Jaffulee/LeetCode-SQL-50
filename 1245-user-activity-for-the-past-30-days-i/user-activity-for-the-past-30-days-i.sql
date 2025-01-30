# Write your MySQL query statement below
SELECT 
        a.activity_date as day
        ,COUNT(DISTINCT a.user_id) AS active_users
FROM Activity as a
WHERE a.activity_date > DATE_ADD(DATE('2019-07-27'), INTERVAL -30 DAY) AND a.activity_date<=DATE('2019-07-27')
GROUP BY a.activity_date

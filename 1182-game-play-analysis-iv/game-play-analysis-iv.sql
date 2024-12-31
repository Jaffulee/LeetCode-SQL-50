/* Write your T-SQL query statement below */
WITH day_after_first_login AS (
    SELECT 
        a.player_id
        ,DATEADD(day,1,MIN(a.event_date)) AS second_day
    FROM Activity AS a
    GROUP BY a.player_id
    )

SELECT 
    ROUND(COUNT(DISTINCT a.player_id)
    /
    (SELECT 1.0*COUNT(DISTINCT a1.player_id) FROM Activity as a1),2) AS fraction
FROM Activity as a
INNER JOIN day_after_first_login as t
ON a.player_id = t.player_id AND a.event_date = t.second_day
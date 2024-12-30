/* Write your T-SQL query statement below */
SELECT Flag.user_id
        ,ROUND(AVG(CAST(Flag.Confirmed_Flag AS FLOAT)),2) AS confirmation_rate
FROM (SELECT S.user_id
            ,CASE WHEN LEFT(C.action,1)='c' THEN 1 ELSE 0 END AS Confirmed_Flag
    FROM Signups as S
    LEFT JOIN Confirmations as C
    ON S.user_id = C.user_id) AS Flag
GROUP BY Flag.user_id



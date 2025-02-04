# Write your MySQL query statement below
SELECT *,
        CASE WHEN t.x+t.y+t.z-GREATEST(t.x,t.y,t.z) > GREATEST(t.x,t.y,t.z) THEN 'Yes' ELSE 'No' END as triangle
FROM Triangle as t
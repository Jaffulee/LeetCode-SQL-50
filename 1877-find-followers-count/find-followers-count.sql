# Write your MySQL query statement below
SELECT f1.user_id
        ,COUNT(f1.follower_id) as followers_count
FROM Followers as f1
GROUP BY f1.user_id
ORDER BY f1.user_id
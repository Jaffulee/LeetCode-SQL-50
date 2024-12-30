/* Write your T-SQL query statement below */
SELECT C.id
        ,C.movie
        ,C.description
        ,C.rating
FROM Cinema AS C
WHERE NOT RIGHT(C.id,1) IN (0,2,4,6,8) AND C.description <> 'boring'
ORDER BY C.rating DESC
/* Write your T-SQL query statement below */
SELECT ATime.machine_id
        ,ROUND(AVG(ATime.processing_time),3) as processing_time
FROM (
    SELECT A.machine_id
            ,A.process_id
            ,SUM(CASE A.activity_type 
                    WHEN 'end' THEN A.timestamp ELSE -A.timestamp 
                END) AS processing_time
            FROM Activity as A
            GROUP BY A.process_id, A.machine_id
) AS ATime
GROUP BY machine_id
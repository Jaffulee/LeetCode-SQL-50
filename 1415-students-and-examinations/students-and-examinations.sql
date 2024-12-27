WITH stsu AS (
    SELECT st.student_id
            ,st.student_name
            ,su.subject_name
    FROM Students AS st
    CROSS JOIN Subjects AS su
    )
SELECT stsu.student_id
        ,stsu.student_name
        ,stsu.subject_name
        ,CASE WHEN e.attended_exams IS NULL THEN 0 ELSE e.attended_exams END as attended_exams
FROM stsu
LEFT JOIN (
            SELECT ex.student_id
                    ,ex.subject_name
                    ,COUNT(ex.student_id) AS attended_exams
            FROM Examinations AS ex
            GROUP BY ex.student_id
                    ,ex.subject_name
            ) AS e
ON stsu.subject_name = e.subject_name AND stsu.student_id = e.student_id
ORDER BY stsu.student_id
        ,stsu.subject_name
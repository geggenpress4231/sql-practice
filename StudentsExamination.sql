SELECT 
    s.student_id, 
    s.student_name,
    subj.subject_name,
    COALESCE(SUM(CASE WHEN e.subject_name = subj.subject_name THEN 1 ELSE 0 END), 0) AS attended_exams
FROM 
    Students s
JOIN 
    Subjects subj
LEFT JOIN 
    Examinations e 
ON 
    s.student_id = e.student_id 
GROUP BY 
    s.student_id, 
    s.student_name, 
    subj.subject_name
ORDER BY 
    s.student_id, 
    subj.subject_name;



SELECT
    S.student_id
    ,S.student_name
    ,Su.subject_name
    ,COUNT(E.student_id) attended_exams
FROM Students S
CROSS JOIN Subjects Su
LEFT JOIN Examinations E
    ON S.student_id = E.student_id
    AND Su.subject_name = E.subject_name
GROUP BY S.student_id, S.student_name, Su.subject_name
ORDER BY S.student_id, S.student_name, Su.subject_name;
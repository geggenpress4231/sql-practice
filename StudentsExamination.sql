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



--cross join aliter more expensive computationally
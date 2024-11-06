SELECT 
    A1.machine_id,
    ROUND(
        AVG(A1.timestamp - A2.timestamp), 3
    ) AS processing_time
FROM 
    Activity A1
JOIN 
    Activity A2 
ON 
    A1.machine_id = A2.machine_id 
    AND A1.process_id = A2.process_id
WHERE 
    A1.activity_type = 'end' 
    AND A2.activity_type = 'start'
GROUP BY 
    A1.machine_id;


-- # Write your MySQL query statement below
-- WITH ProcessDurations AS (
--     SELECT 
--         machine_id,
--         process_id,
--         MAX(CASE WHEN activity_type = 'end' THEN timestamp ELSE NULL END) - 
--         MAX(CASE WHEN activity_type = 'start' THEN timestamp ELSE NULL END) AS duration
--     FROM 
--         Activity
--     GROUP BY 
--         machine_id, process_id
-- )

-- SELECT 
--     machine_id,
--     ROUND(AVG(duration), 3) AS processing_time
-- FROM 
--     ProcessDurations
-- GROUP BY 
--     machine_id;

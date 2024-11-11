# Write your MySQL query statement below
-- select v.customer_id,v.visit_id from Visits v left join Transactions t on v.visit_id=t.visit_id 

SELECT 
    customer_id, 
    COUNT(visit_id) AS count_no_trans
FROM 
    Visits 
WHERE 
    visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY 
    customer_id;


SELECT 
    v.customer_id, 
    COUNT(v.visit_id) AS count_no_trans
FROM 
    Visits v
LEFT JOIN 
    Transactions t 
ON 
    v.visit_id = t.visit_id
WHERE 
    t.visit_id IS NULL
GROUP BY 
    v.customer_id;

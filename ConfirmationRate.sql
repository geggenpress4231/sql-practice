# Write your MySQL query statement below
-- select user_id,(sum(case action when 'confirmed' then 1 else 0 end))/count(*)
-- as confirmation_rate from confirmations
-- group by user_id

SELECT s.user_id, 
       COALESCE(
           ROUND((SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id)),2),
           0
       ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

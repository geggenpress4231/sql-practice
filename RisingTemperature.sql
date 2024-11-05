-- SELECT w1.id
-- FROM Weather w1
-- JOIN Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
-- WHERE w1.temperature > w2.temperature;

-- SELECT id
-- FROM (
--     SELECT id, recordDate, temperature, 
--            LAG(recordDate) OVER (ORDER BY recordDate) AS prevDate,
--            LAG(temperature) OVER (ORDER BY recordDate) AS prevTemp
--     FROM Weather
-- ) AS temp_table
-- WHERE DATEDIFF(recordDate, prevDate) = 1 AND temperature > prevTemp;

WITH TempCTE AS (
    SELECT id, recordDate, temperature,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prevDate,
           LAG(temperature) OVER (ORDER BY recordDate) AS prevTemp
    FROM Weather
)
SELECT id
FROM TempCTE
WHERE DATEDIFF(recordDate, prevDate) = 1 AND temperature > prevTemp;

SELECT w1.id
FROM Weather w1
JOIN Weather w2 ON w1.recordDate = w2.recordDate + INTERVAL 1 DAY
WHERE w1.temperature > w2.temperature;
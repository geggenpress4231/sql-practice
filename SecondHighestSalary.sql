SELECT 
    IFNULL(
        (SELECT DISTINCT salary 
         FROM Employee 
         WHERE salary < (SELECT MAX(salary) FROM Employee)
         ORDER BY salary DESC 
         LIMIT 1), 
        NULL
    ) AS SecondHighestSalary;

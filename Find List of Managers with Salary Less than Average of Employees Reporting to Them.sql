-- Write a query to get the list of managers whose salary is less than twice the average salary of employees reporting to them. 
-- For these managers, output their ID, salary and the average salary of employees reporting to them.



SELECT
    h.manager_empl_id,
    man.salary manager_salary,
    AVG(sub.salary) avg_employee_salary
FROM map_employee_hierarchy h
LEFT JOIN dim_employee sub
ON h.empl_id = sub.empl_id
LEFT JOIN dim_employee man
ON h.manager_empl_id = man.empl_id
GROUP BY h.manager_empl_id, man.salary
HAVING man.salary < (2*AVG(sub.salary))
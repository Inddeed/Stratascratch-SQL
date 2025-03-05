-- Given a single column of numbers, 
-- consider all possible permutations of two numbers assuming that pairs of numbers (x,y) and (y,x) are two different permutations. 
-- Then, for each permutation, find the maximum of the two numbers.
-- Output three columns: the first number, the second number and the maximum of the two.

WITH first_n AS (  
    SELECT number AS x
    FROM deloitte_numbers
), second_n AS (  
    SELECT number AS y
    FROM deloitte_numbers
)
SELECT 
    x,
    y, 
    CASE WHEN MAX(x) > MAX(y) THEN MAX(x) ELSE MAX(y) END maxes FROM first_n
CROSS JOIN second_n
GROUP BY x, y
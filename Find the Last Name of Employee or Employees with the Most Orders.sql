-- What is the last name of the employee or employees who are responsible for the most orders?

WITH base AS (
    SELECT
        e.id,
        e.last_name,
        DENSE_RANK() OVER(ORDER BY COUNT(o.order_id) DESC) ranks
    FROM shopify_employees e
    LEFT JOIN shopify_orders o
    ON e.id = o.resp_employee_id
    GROUP BY e.id, e.last_name
)
SELECT
    last_name
FROM base
WHERE ranks = 1
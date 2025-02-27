-- Return the top 2 users in each company that called the most. 
-- Output the company_id, user_id, and the user's rank. 
-- If there are multiple users in the same rank, keep all of them.


WITH company AS (
    SELECT
        u.company_id company_id,
        c.user_id user_id,
        COUNT(c.user_id) cnt
    FROM rc_calls c
    LEFT JOIN rc_users u
    ON c.user_id = u.user_id
    GROUP BY c.user_id, u.company_id
), ranked AS (
    SELECT
        *,
        DENSE_RANK() OVER(PARTITION BY company_id ORDER BY cnt DESC) ranked
    FROM company
)
SELECT 
    company_id, user_id, ranked
FROM ranked
WHERE ranked <= 2
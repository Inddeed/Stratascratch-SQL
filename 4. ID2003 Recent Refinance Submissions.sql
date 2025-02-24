-- Write a query that joins this submissions table to the loans table 
-- and returns the total loan balance on each user’s most recent ‘Refinance’ submission. 
-- Return all users and the balance for each of them.


WITH refinance_recencies AS (
    SELECT
        l.user_id,
        s.balance,
        ROW_NUMBER() OVER (PARTITION BY l.user_id ORDER BY l.created_at DESC) recency
    FROM loans l
    INNER JOIN submissions s
    ON l.id = s.loan_id
    WHERE type = 'Refinance'
)
SELECT 
    user_id,
    balance
FROM refinance_recencies r
WHERE recency = 1

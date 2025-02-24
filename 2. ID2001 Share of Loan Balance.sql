-- Write a query that returns the rate_type, loan_id, loan balance , and a column 
-- that shows with what percentage the loan's balance contributes to 
-- the total balance among the loans of the same rate type.

WITH total_balance AS (
    SELECT rate_type, SUM(balance) total
    FROM submissions
    GROUP BY rate_type
)
SELECT 
    s.loan_id,
    s.rate_type,
    s.balance,
    s.balance * 100.0 / t.total balance_share
FROM submissions s
LEFT JOIN total_balance t
ON s.rate_type = t.rate_type

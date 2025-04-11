-- Find the number of unique transactions and total sales for each of the product categories in 2017. 
-- Output the product categories, number of transactions, and total sales in descending order. 
-- The sales column represents the total cost the customer paid for the product so no additional calculations need to be done on the column.
-- Only include product categories that have products sold.

SELECT 
    p.product_category, 
    COUNT(DISTINCT t.transaction_id), 
    SUM(t.sales) sales
FROM wfm_transactions t
LEFT JOIN wfm_products p
ON t.product_id = p.product_id
WHERE EXTRACT(YEAR FROM t.transaction_date) = 2017
GROUP BY p.product_category
ORDER BY sales DESC
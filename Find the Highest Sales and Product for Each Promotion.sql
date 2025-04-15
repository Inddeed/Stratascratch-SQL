-- The marketing department is assessing the success of their promotional campaigns.
-- You have been asked to find which products sold the most units for each promotion.
-- Your output should contain the promotion ID, product ID, and corresponding total sales for the most successful product ID. 
-- In the case of a tie, output all results.

WITH base AS (
    SELECT
        promotion_id,
        product_id,
        SUM(units_sold) total_sales,
        DENSE_RANK() OVER(PARTITION BY promotion_id ORDER BY SUM(units_sold) DESC) ranked
    FROM online_orders
    GROUP BY promotion_id, product_id
)
SELECT 
    promotion_id,
    product_id,
    total_sales
FROM base 
WHERE ranked = 1
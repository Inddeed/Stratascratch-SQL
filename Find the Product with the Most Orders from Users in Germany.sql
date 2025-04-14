-- Find the product with the most orders from users in Germany. 
-- Output the market name of the product or products in case of a tie.

WITH base AS (
    SELECT
        d.market_name,
        DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) ranks
    FROM shopify_orders o
    LEFT JOIN map_product_order m
    ON o.order_id = m.order_id
    LEFT JOIN shopify_users u
    ON o.user_id = u.id
    LEFT JOIN dim_product d
    ON d.prod_sku_id = m.product_id
    WHERE u.country = 'Germany'
    GROUP BY d.market_name
)
SELECT 
    market_name
FROM base
WHERE ranks = 1
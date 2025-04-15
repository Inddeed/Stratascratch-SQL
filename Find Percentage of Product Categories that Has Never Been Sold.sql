-- The VP of Sales feels that some product categories don't sell and can be completely removed from the inventory.
-- As a first pass analysis, they want you to find what percentage of product categories have never been sold.

WITH base AS (
    SELECT
        SUM(o.units_sold) sold
    FROM online_product_categories c
    LEFT JOIN online_products p
    ON c.category_id = p.product_category
    LEFT JOIN online_orders o
    ON o.product_id = p.product_id
    GROUP BY c.category_id
)
SELECT 
    SUM(CASE WHEN sold IS NULL THEN 1 ELSE 0 END)*1.0/COUNT(*)*100 pct
FROM base
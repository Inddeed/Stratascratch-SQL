-- The company you work for is looking at their delivery drivers' first-ever delivery with the company.
-- You have been tasked with finding what percentage of drivers' first-ever completed orders have a rating of 0.
-- Note: Please remember that if an order has a blank value for actual_delivery_time, it has been canceled and therefore does not count as a completed delivery.

WITH first_delivery AS (
    SELECT
        driver_id,
        MIN(order_placed_time) first_order
    FROM delivery_orders
    WHERE actual_delivery_time IS NOT NULL
    GROUP BY driver_id
), rating AS (
    SELECT
        f.driver_id,
        o.delivery_rating
    FROM first_delivery f
    LEFT JOIN delivery_orders o
    ON f.driver_id = o.driver_id
    AND f.first_order = o.order_placed_time
)
SELECT 
    SUM(CASE WHEN delivery_rating = 0 THEN 1 ELSE 0 END)::FLOAT/COUNT(*)*100 pct_zero_rating
FROM rating
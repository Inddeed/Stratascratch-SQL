-- A group of travelers embark on world tours starting with their home cities. 
-- Each traveler has an undecided itinerary that evolves over the course of the tour. 
-- Some travelers decide to abruptly end their journey mid-travel and live in their last destination.
-- Given the dataset of dates on which they travelled between different pairs of cities, 
-- can you find out how many travellers ended back in their home city? For simplicity,
-- you can assume that each traveler made at most one trip between two cities in a day.

WITH orders AS (
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY traveler ORDER BY date ASC) mins,
        ROW_NUMBER() OVER(PARTITION BY traveler ORDER BY date DESC) maxs
    FROM travel_history
)
SELECT 
    COUNT(*)
FROM orders o1
LEFT JOIN orders o2
ON o1.traveler = o2.traveler
AND o1.mins = o2.maxs
WHERE o1.mins = 1
AND o1.start_city = o2.end_city
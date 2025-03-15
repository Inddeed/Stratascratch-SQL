-- Find neighborhoods that have properties with a parking space and no cleaning fees

SELECT DISTINCT(neighbourhood)
FROM airbnb_search_details
WHERE cleaning_fee = FALSE
AND LOWER(amenities) LIKE '%parking%'
-- Redfin helps clients to find agents. 
-- Each client will have a unique request_id and each request_id has several calls. 
-- For each request_id, the first call is an “initial call” and all the following calls are “update calls”.  
-- What's the average call duration for all initial calls?

WITH initial_call AS (
    SELECT 
        request_id,
        call_duration,
        ROW_NUMBER() OVER(PARTITION BY request_id ORDER BY created_on ASC)
        ranked
    FROM redfin_call_tracking
)
SELECT
    AVG(call_duration)
FROM initial_call
WHERE ranked = 1
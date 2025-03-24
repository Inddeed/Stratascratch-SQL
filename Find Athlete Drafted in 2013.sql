-- How many athletes were drafted into NFL from 2013 NFL Combine?
-- The pickround column specifies if the athlete was drafted into the NFL. 
-- A value of 0 means that the athlete was not drafted into the NFL.

SELECT COUNT(DISTINCT name)
FROM nfl_combine
WHERE pickround > 0
AND year = 2013
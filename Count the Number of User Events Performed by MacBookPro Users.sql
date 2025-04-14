-- Count the number of user events performed by MacBookPro users.
-- Output the result along with the event name.
-- Sort the result based on the event count in the descending order.

SELECT
    event_name,
    COUNT(*) cnt
FROM playbook_events
WHERE LOWER(device) = 'macbook pro'
GROUP BY event_name
ORDER BY cnt DESC
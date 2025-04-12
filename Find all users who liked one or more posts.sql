-- Find all users who liked one or more posts

SELECT 
    friend
FROM facebook_reactions
WHERE reaction = 'like'
GROUP BY friend
HAVING COUNT(poster) >= 1
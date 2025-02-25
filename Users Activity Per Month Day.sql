-- Return a distribution of users activity per day of the month. 
-- By distribution we mean the number of posts per day of the month.


SELECT 
    EXTRACT(DAY FROM post_date), 
    COUNT(post_date) 
FROM facebook_posts
GROUP BY post_date

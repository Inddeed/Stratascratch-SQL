-- Return the total number of comments received for each user 
-- in the 30 or less days before 2020-02-10. 
-- Don't output users who haven't received any comment in the defined time period.


SELECT
    user_id,
    SUM(number_of_comments) number_of_comments
FROM fb_comments_count
WHERE DATEDIFF('2020-02-10', created_at) BETWEEN 0 AND 30
GROUP BY user_id
HAVING SUM(number_of_comments) > 0

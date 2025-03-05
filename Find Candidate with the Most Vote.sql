-- The election is conducted in a city and everyone can vote for one or more candidates, or choose not to vote at all. 
-- Each person has 1 vote so if they vote for multiple candidates, their vote gets equally split across these candidates. 
-- For example, if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 vote each. 
-- Some voters have chosen not to vote, which explains the blank entries in the dataset.
-- Find out who got the most votes and won the election. Output the name of the candidate or multiple names in case of a tie.
-- To avoid issues with a floating-point error you can round the number of votes received by a candidate to 3 decimal places.

WITH voter_score AS (
    SELECT 
        voter,
        1.0 / NULLIF(COUNT(candidate),0) score
    FROM voting_results
    GROUP BY voter
), ranking AS (
    SELECT 
        r.candidate,
        SUM(s.score),
        DENSE_RANK() OVER(ORDER BY SUM(s.score) DESC) ranked
    FROM voting_results r
    LEFT JOIN voter_score s
    ON r.voter = s.voter
    GROUP BY r.candidate
)
SELECT candidate FROM ranking WHERE ranked = 1
SELECT salaries.salary
FROM salaries
WHERE salaries.player_id = (
    SELECT player_id
    FROM performances
    WHERE H = (SELECT MAX(H) FROM performances)
);
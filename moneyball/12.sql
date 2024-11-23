WITH least_expensive_hit AS (
    SELECT 
        players.id AS player_id,
        players.first_name AS hit_first_name, 
        players.last_name AS hit_last_name, 
        (salaries.salary * 1.0 / performances.H) AS dollars_per_hit
    FROM players
    JOIN salaries ON players.id = salaries.player_id
    JOIN performances ON players.id = performances.player_id
    WHERE salaries.year = 2001 
      AND performances.year = 2001 
      AND performances.H > 0
    ORDER BY dollars_per_hit ASC
    LIMIT 10
),
least_expensive_rbi AS (
    SELECT 
        players.id AS player_id,
        players.first_name AS rbi_first_name, 
        players.last_name AS rbi_last_name, 
        (salaries.salary * 1.0 / performances.RBI) AS dollars_per_rbi
    FROM players
    JOIN salaries ON players.id = salaries.player_id
    JOIN performances ON players.id = performances.player_id
    WHERE salaries.year = 2001 
      AND performances.year = 2001 
      AND performances.RBI > 0
    ORDER BY dollars_per_rbi ASC
    LIMIT 10
)
SELECT 
    hit_first_name AS first_name, 
    hit_last_name AS last_name
FROM least_expensive_hit
JOIN least_expensive_rbi 
    ON least_expensive_hit.player_id = least_expensive_rbi.player_id
ORDER BY first_name, last_name;

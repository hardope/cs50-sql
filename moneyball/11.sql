SELECT 
    players.first_name, 
    players.last_name, 
    (salaries.salary / performances.H) AS dollars_per_hit
FROM players
JOIN salaries ON players.id = salaries.player_id
JOIN performances ON players.id = performances.player_id
WHERE salaries.year = 2001 
  AND performances.year = 2001 
  AND performances.H > 0
ORDER BY dollars_per_hit ASC, players.first_name ASC, players.last_name ASC
LIMIT 10;

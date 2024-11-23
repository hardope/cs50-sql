SELECT 
    players.first_name, 
    players.last_name, 
    salaries.salary, 
    performances.H AS home_runs, 
    salaries.year AS salary_year, 
    performances.year AS performance_year
FROM players
JOIN salaries ON players.id = salaries.player_id
JOIN performances ON players.id = performances.player_id
WHERE salaries.year = performances.year
ORDER BY players.id ASC, performances.year DESC, performances.H DESC, salaries.salary DESC;

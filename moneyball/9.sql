SELECT teams.name, ROUND(AVG(salaries.salary), 2) AS "average salary"
FROM salaries
JOIN teams ON salaries.team_id = teams.id
WHERE salaries.year = 2001
GROUP BY teams.name
ORDER BY "average salary" ASC
LIMIT 5;

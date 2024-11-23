SELECT users.username
FROM messages
JOIN users ON messages.to_user_id = users.id
GROUP BY users.username
ORDER BY COUNT(messages.id) DESC
LIMIT 1;
SELECT f1.friend_id
FROM friends AS f1
JOIN users AS u1 ON f1.user_id = u1.id
JOIN friends AS f2 ON f1.friend_id = f2.friend_id
JOIN users AS u2 ON f2.user_id = u2.id
WHERE u1.username = 'lovelytrust487'
  AND u2.username = 'exceptionalinspiration482';
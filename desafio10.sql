SELECT
c.song AS nome,
COUNT(q.song_id) AS reproducoes 
FROM `SpotifyClone`.songs AS c
INNER JOIN `SpotifyClone`.reproduction_history AS q
ON c.id = q.song_id
inner JOIN `SpotifyClone`.users AS u
ON u.id = q.user_id
WHERE u.plano_id = 1 OR u.plano_id = 4 
GROUP BY nome
ORDER BY nome;
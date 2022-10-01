SELECT
DISTINCT so.song AS cancao,
COUNT(so.song) AS reproducoes
FROM 
SpotifyClone.songs AS so
INNER JOIN SpotifyClone.reproduction_history AS rh
ON so.id = rh.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
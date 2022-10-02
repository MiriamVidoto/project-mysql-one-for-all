SELECT
COUNT(r.user_id ) AS quantidade_musicas_no_historico
FROM SpotifyClone.reproduction_history AS r
WHERE r.user_id = 1;
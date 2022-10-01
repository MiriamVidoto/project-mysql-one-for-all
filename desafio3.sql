SELECT
  nome_completo AS usuario,
  COUNT(rh.user_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(duration) / 60, 2) AS total_minutos
FROM
  SpotifyClone.users AS u
INNER JOIN SpotifyClone.reproduction_history AS rh
  ON u.id = rh.user_id
INNER JOIN SpotifyClone.songs AS so
  ON rh.song_id = so.id
  GROUP BY
  nome_completo
ORDER BY
  nome_completo;
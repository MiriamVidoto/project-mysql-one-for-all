SELECT
  COUNT(DISTINCT s.song) AS cancoes,
  COUNT(DISTINCT ar.id) AS artistas,
  COUNT(DISTINCT al.id) AS albuns
FROM
  SpotifyClone.songs AS s
  INNER JOIN SpotifyClone.albums AS al
  ON al.id = s.album_id
  INNER JOIN SpotifyClone.artists AS ar
  ON ar.id = al.artist_id

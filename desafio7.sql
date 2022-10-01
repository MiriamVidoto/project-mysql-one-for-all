SELECT
ar.artist AS artista,
al.album AS album,
COUNT(fo.artist_id) AS seguidores
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al
ON ar.id = al.artist_id
INNER JOIN SpotifyClone.follow_artists AS fo
ON ar.id = fo.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;

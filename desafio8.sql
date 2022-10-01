SELECT
ar.artist AS artista,
al.album AS album
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al
ON ar.id = al.artist_id
WHERE ar.artist = 'Elis Regina'
ORDER BY album;

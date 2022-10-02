SELECT
  song AS nome_musica,
  CASE
    WHEN song LIKE '%Bard%' THEN REPLACE(song, 'Bard', 'QA')
    WHEN song LIKE '%Amar%' THEN REPLACE(song, 'Amar', 'Code Review')
    WHEN song LIKE '%Pais%' THEN REPLACE(song, 'Pais', 'Pull Requests')
    WHEN song LIKE '%SOUL%' THEN REPLACE(song, 'SOUL', 'CODE')
    WHEN song LIKE '%SUPERSTAR%' THEN REPLACE(song, 'SUPERSTAR', 'SUPERDEV')
  END AS novo_nome
FROM SpotifyClone.songs
WHERE
  song LIKE '%Bard%' OR
  song LIKE '%Amar%' OR
  song LIKE '%Pais%' OR
  song LIKE '%SOUL%' OR
  song LIKE '%SUPERSTAR%'
ORDER BY nome_musica DESC;
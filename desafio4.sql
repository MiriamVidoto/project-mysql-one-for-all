SELECT
  u.nome_completo AS usuario,
  IF(
    YEAR(MAX(rh.reproduction_date)) >= 2021,
    'Usuário ativo',
    'Usuário inativo'
  ) AS status_usuario
FROM
  SpotifyClone.users AS u
  INNER JOIN SpotifyClone.reproduction_history AS rh
  ON u.id = rh.user_id
GROUP BY usuario
ORDER BY usuario;

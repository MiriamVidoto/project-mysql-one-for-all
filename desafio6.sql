SELECT
FORMAT(MIN(pl.value_plan), 2) AS faturamento_minimo,
FORMAT(MAX(pl.value_plan), 2) AS faturamento_maximo,
FORMAT(AVG(pl.value_plan), 2) AS faturamento_medio,
FORMAT(SUM(pl.value_plan), 2) AS faturamento_total
FROM SpotifyClone.plans AS pl
INNER JOIN SpotifyClone.users AS u
ON u.plano_id = pl.id;
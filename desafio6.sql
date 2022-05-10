SELECT MIN(pla.valor) AS faturamento_minimo, 
MAX(pla.valor) AS faturamento_maximo,
ROUND(AVG(pla.valor), 2) AS faturamento_medio,
SUM(pla.valor) AS faturamento_total 
FROM SpotifyClone.plano_de_assinaturas AS pla
INNER JOIN SpotifyClone.usuarios AS us
ON pla.assinatura_id = us.assinatura_id;
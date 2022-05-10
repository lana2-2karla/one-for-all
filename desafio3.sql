SELECT us.usuario_nome AS usuario,
COUNT(ms.musica_id) AS qtde_musicas_ouvidas,
ROUND(SUM(ms.duracao_em_segundos / 60), 2) AS total_minutos
FROM SpotifyClone.musicas AS ms
INNER JOIN SpotifyClone.usuarios_musicas AS ums
ON ms.musica_id = ums.musica_id
INNER JOIN SpotifyClone.usuarios AS us
ON ums.usuario_id = us.usuario_id
GROUP BY usuario;
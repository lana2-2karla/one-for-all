SELECT ms.musica_nome AS cancao,
COUNT(usm.usuario_id) AS reproducoes
FROM SpotifyClone.musicas AS ms
INNER JOIN SpotifyClone.usuarios_musicas AS usm
ON ms.musica_id = usm.musica_id
GROUP BY cancao
ORDER BY
reproducoes desc,
cancao LIMIT 2;
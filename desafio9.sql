SELECT COUNT(um.musica_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.usuarios_musicas AS um
INNER JOIN SpotifyClone.usuarios AS us
ON um.usuario_id = us.usuario_id
WHERE us.usuario_nome = 'Bill';
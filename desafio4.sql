SELECT us.usuario_nome AS usuario, 
IF (MAX(usm.data_de_reproducao) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.usuarios AS us
INNER JOIN SpotifyClone.usuarios_musicas AS usm
ON us.usuario_id = usm.usuario_id
GROUP BY us.usuario_nome;
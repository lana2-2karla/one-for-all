SELECT art.artista_nome AS artista, 
al.album_nome AS album, 
COUNT(ua.artista_id) AS seguidores
FROM SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artistas AS art
ON al.artista_id = art.artista_id
INNER JOIN SpotifyClone.usuarios_artistas As ua
ON al.artista_id = ua.artista_id
GROUP BY art.artista_nome, al.album_nome
ORDER BY seguidores DESC, artista, album ASC;
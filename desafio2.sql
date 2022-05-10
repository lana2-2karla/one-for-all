SELECT COUNT(ms.musica_id) AS cancoes, 
COUNT(DISTINCT al.artista_id) AS artistas,
COUNT(DISTINCT al.album_id) AS albuns
FROM SpotifyClone.musicas AS ms
INNER JOIN SpotifyClone.albuns AS al
ON ms.album_id = al.album_id;
SELECT art.artista_nome AS artista,
al.album_nome AS album
FROM SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artistas AS art
ON al.artista_id = art.artista_id
WHERE art.artista_nome = 'Walter Phoenix'
ORDER BY album;
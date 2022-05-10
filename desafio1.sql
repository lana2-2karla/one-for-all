DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano_de_assinaturas(
    assinatura_id INT PRIMARY KEY AUTO_INCREMENT,
    assinatura_nome VARCHAR(50) NOT NULL,
    valor DECIMAL NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(50) NOT NULL,
    usuario_idade INT NOT NULL,
    data_de_assinatura DATE NOT NULL,
    assinatura_id INT NOT NULL,
    FOREIGN KEY(assinatura_id) REFERENCES plano_de_assinaturas(assinatura_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
    artista_id INT NOT NULL,
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(50) NOT NULL,
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.musicas(
    musica_id INT PRIMARY KEY AUTO_INCREMENT,
    musica_nome VARCHAR(50) NOT NULL,
    duracao_em_segundos INT NOT NULL,
    ano_de_lancamento INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios_musicas(
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_de_reproducao VARCHAR(50) NOT NULL,
    PRIMARY KEY(usuario_id, musica_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY(musica_id) REFERENCES musicas(musica_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios_artistas(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano_de_assinaturas (assinatura_nome, valor)
VALUES
  ('gratuito', '0.00'),   
  ('familiar', '7.99'),   
  ('universitário', '5.99'),   
  ('pessoal', '6.99');
  
INSERT INTO SpotifyClone.usuarios (usuario_nome, usuario_idade, assinatura_id, data_de_assinatura)
VALUES
  ('Thati', '23', '1', '2019-10-20'),
  ('Cintia', '35', '2', '2017-12-30'),
  ('Bill', '20', '3', '2019-06-05'),
  ('Roger', '45', '4', '2020-05-13'),
  ('Norman', '58', '4', '2017-02-17'),
  ('Patrick', '33', '2', '2017-01-06'),
  ('Vivian', '26', '3', '2018-01-05'),
  ('Carol', '19', '3', '2018-02-14'),
  ('Angelina', '42', '2', '2018-04-29'),
  ('Paul', '46', '2', '2017-01-17');

INSERT INTO SpotifyClone.artistas (artista_nome)
VALUES
  ('Walter Phoenix'), 
  ('Peter Strong'), 
  ('Lance Day'),
  ('Freedie Shannon'), 
  ('Tyler Isle'), 
  ('Fog');

INSERT INTO SpotifyClone.albuns (artista_id, album_nome)
VALUES
  ('1', 'Envious'),     
  ('1', 'Exuberant'),
  ('2', 'Hallowed Steam'),
  ('3', 'Incandescent'),
  ('4', 'Temporary Culture'),
  ('4', 'Library of liberty'),
  ('5', 'Chained Down'),
  ('5', 'Cabinet of fools'),
  ('5', 'No guarantees'),
  ('6', 'Apparatus');

INSERT INTO SpotifyClone.musicas (album_id, musica_nome, duracao_em_segundos, ano_de_lancamento)
VALUES
  ('1', 'Soul For Us', '200', '1990'),       
  ('1', 'Reflections Of Magic', '163', '1990'),
  ('1', 'Dance With Her Own', '116', '1990'),
  ('2', 'Troubles Of My Inner Fire', '203', '1993'),
  ('2', 'Time Fireworks', '152', '1993'),
  ('3', 'Magic Circus', '105', '1995'),
  ('3', 'Honey, So Do I', '207', '1995'),
  ('3', "Sweetie, Let's Go Wild", '139', '1995'),
  ('3', 'She Knows', '244', '1995'),
  ('4', 'Fantasy For Me', '100', '1998'),
  ('4', 'Celebration Of More', '146', '1998'),
  ('4', 'Rock His Everything', '223', '1998'),
  ('4', 'Home Forever', '231', '1998'),
  ('4', 'Diamond Power', '241', '1998'),
  ('4', "Let's Be Silly", '132', '1998'),
  ('5', 'Thang Of Thunder', '240', '2001'),
  ('5', 'Words Of Her Life', '185', '2001'),
  ('5', 'Without My Streets', '176', '2001'),
  ('6', 'Need Of The Evening', '190', '2003'),
  ('6', 'History Of My Roses', '222', '2003'),
  ('6', 'Without My Love', '111', '2003'),
  ('6', 'Walking And Game', '123', '2003'),
  ('6', 'Young And Father', '197', '2003'),
  ('7', 'Finding My Traditions', '179', '2007'),
  ('7', 'Walking And Man', '229', '2007'),
  ('7', 'Hard And Time', '135', '2007'),
  ('7', "Honey, I'm A Lone Wolf", '150', '2007'),
  ('8', "She Thinks I Won't Stay Tonight", '166', '2012'),
  ('8', "He Heard You're Bad For Me", '154', '2012'),
  ('8', "He Hopes We Can't Stay", '210', '2012'),
  ('8', 'I Know I Know', '117', '2012'),
  ('9', "He's Walking Away", '159', '2015'),
  ('9', "He's Trouble", '138', 2015),
  ('9', 'I Heard I Want To Bo Alone', '120', '2015'),
  ('9', 'I Ride Alone', '151', '2015'),
  ('10', 'Honey', '79', '2015'),
  ('10', 'You Cheated On Me', '95', '2015'),
  ('10', "Wouldn't It Be Nice", '213', '2015'),
  ('10', 'Baby', '136', '2015'),
  ('10', 'You Make Me Feel So..', '83','2015');

  INSERT INTO SpotifyClone.usuarios_musicas (usuario_id, musica_id, data_de_reproducao)
VALUES
  ('1', '36', '2020-02-28 10:45:55'),     
  ('1', '25', '2020-05-02 05:30:35'),
  ('1', '23', '2020-03-06 11:22:33'),
  ('1', '14', '2020-08-05 08:05:17'),
  ('1', '15', '2020-09-14 16:32:22'),
  ('2', '34', '2020-01-02 07:40:33'),
  ('2', '24', '2020-05-16 06:16:22'),
  ('2', '21', '2020-10-09 12:27:48'),
  ('2', '39', '2020-09-21 13:14:46'),
  ('3', '6', '2020-11-13 16:55:13'),
  ('3', '3', '2020-12-05 18:38:30'),
  ('3', '26', '2020-07-30 10:00:00'),
  ('4', '2', '2021-08-15 17:10:10'),
  ('4', '35', '2021-07-10 15:20:30'),
  ('4', '27', '2021-01-09 01:44:33'),
  ('5', '7', '2020-07-03 19:33:28'),
  ('5', '12', '2017-02-24 21:14:22'),
  ('5', '14', '2020-08-06 15:23:43'),
  ('5', '1', '2020-11-10 13:52:27'),
  ('6', '38', '2019-02-07 20:33:48'),
  ('6', '29', '2017-01-24 00:31:17'),
  ('6', '30', '2017-10-12 12:35:20'),
  ('6', '22', '2018-05-29 14:56:41'),
  ('7', '5', '2018-05-09 22:30:49'),
  ('7', '4', '2020-07-27 12:52:58'),
  ('7', '11', '2018-01-16 18:40:43'),
  ('8', '39', '2018-03-21 16:56:40'),
  ('8', '40', '2020-10-18 13:38:05'),
  ('8', '32', '2019-05-25 08:14:03'),
  ('8', '33', '2021-08-15 21:37:09'),
  ('9', '16', '2021-05-24 17:23:45'),
  ('9', '17', '2018-12-07 22:48:52'),
  ('9', '8', '2021-03-14 06:14:26'),
  ('9', '9', '2020-04-01 03:36:00'),
  ('10', '20', '2017-02-06 08:21:34'),
  ('10', '21', '2017-12-04 05:33:43'),
  ('10', '12', '2017-07-27 05:24:49'),
  ('10', '13', '2017-12-25 01:03:57');

INSERT INTO SpotifyClone.usuarios_artistas (usuario_id, artista_id)
VALUES
  ('1', '1'),  
  ('1', '4'),  
  ('1', '3'),  
  ('2', '1'),  
  ('2', '3'),  
  ('3', '2'),  
  ('3', '1'),  
  ('4', '4'),  
  ('5', '5'),  
  ('5', '6'),  
  ('6', '6'),  
  ('6', '3'),  
  ('6', '1'),  
  ('7', '2'),  
  ('7', '5'),  
  ('8', '1'),  
  ('8', '5'),  
  ('9', '6'),  
  ('9', '4'),  
  ('9', '3'),  
  ('10', '2'),  
  ('10', '6');

  
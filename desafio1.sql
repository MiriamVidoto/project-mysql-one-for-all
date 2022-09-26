DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.`year_of_release` (
    id INT PRIMARY  KEY NOT NULL AUTO_INCREMENT,
    `year` INT NOT NULL UNIQUE
  ) engine = InnoDB;

	CREATE TABLE SpotifyClone.artists (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		artist VARCHAR(45)
	) engine = InnoDB;
    
  CREATE TABLE SpotifyClone.albums (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(100),
    artist_id INT,
    year_of_release_id INT,
    CONSTRAINT `id_artist` FOREIGN KEY(`artist_id`) REFERENCES `SpotifyClone`.`artists`(`id`),
    CONSTRAINT `id_year_of_release` FOREIGN KEY(`year_of_release_id`) REFERENCES `SpotifyClone`.`year_of_release`(`id`)
	) engine = InnoDB;
    
  CREATE TABLE `SpotifyClone`.`plans`(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plan VARCHAR(45),
    value_plan FLOAT
	) engine = InnoDB;

	CREATE TABLE `SpotifyClone`.`user`(
    id  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(45) UNIQUE,
    idade INT,
    signature_date DATE,
    plano_id INT,
    FOREIGN KEY(`plano_id`) REFERENCES `SpotifyClone`.`plans`(`id`)
	) engine = InnoDB;
    
  CREATE TABLE SpotifyClone.songs(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    song VARCHAR(100),
    duration INT,
    album_id INT,
    FOREIGN KEY(`album_id`) REFERENCES `SpotifyClone`.`albums`(`id`)
	);

	CREATE TABLE `SpotifyClone`.`reproduction_history`(
    reproduction_date DATETIME,
    song_id int,
    user_id int,
    PRIMARY KEY(song_id, user_id),
    FOREIGN KEY(`song_id`) REFERENCES songs(id),
    FOREIGN KEY(`user_id`) REFERENCES `user`(id)
	) engine = InnoDB;
    
    CREATE TABLE SpotifyClone.follow_artists (  
	user_id INT, 
	artist_id INT,
  PRIMARY KEY(user_id, artist_id),
	FOREIGN KEY(user_id) REFERENCES `user`(id),
	FOREIGN KEY(artist_id) REFERENCES artists(id)
	) engine = InnoDB;

INSERT INTO SpotifyClone.`year_of_release` 
	(id, `year`)
VALUES
    (DEFAULT, 2022),
    (DEFAULT, 1978),
    (DEFAULT, 1982),
    (DEFAULT, 1998),
    (DEFAULT, 2001),
    (DEFAULT, 2003),
    (DEFAULT, 2007),
    (DEFAULT, 2012);
    
INSERT INTO SpotifyClone.artists
(id, artist)
VALUES
(DEFAULT, 'Beyoncé'),
(DEFAULT, 'Queen'),
(DEFAULT, 'Elis Regina'),
(DEFAULT, 'Baco Exu do Blues'),
(DEFAULT, 'Blind Guardian'),
(DEFAULT, 'Nina Simone');

INSERT INTO SpotifyClone.albums 
	(id, album, artist_id, year_of_release_id)
VALUES
	(DEFAULT, 'Renaissance', 1, 1),
	(DEFAULT, 'Jazz', 2, 2),
	(DEFAULT, 'Hot Space', 2, 3),
	(DEFAULT, 'Falso Brilhante', 3, 4),
	(DEFAULT, 'Vento de Maio', 3, 5),
	(DEFAULT, 'QVVJFA?', 4, 6),
	(DEFAULT, 'Somewhere Far Beyond', 5, 7),
	(DEFAULT, 'I Put A Spell On You', 6, 8);

INSERT INTO SpotifyClone.plans (id, plan, value_plan)
VALUES
	(DEFAULT, 'free', 0.00),
	(DEFAULT, 'family', 7.99),
	(DEFAULT, 'university', 5.99),
	(DEFAULT, 'guys', 6.99);
    
INSERT INTO SpotifyClone.`user`
	(id, nome_completo, idade, signature_date, plano_id )
VALUES
	(DEFAULT, 'Barbara Liskov', 82, '2019-10-20', 1 ),
	(DEFAULT, 'Robert Cecil Martin', 58, '2017-01-06', 1),
	(DEFAULT, 'Ada Lovelace', 37, '2017-12-30', 2),
	(DEFAULT, 'Martin Fowler', 46, '2017-01-17', 2),
	(DEFAULT, 'Sandi Metz', 58, '2018-04-29', 2),
	(DEFAULT, 'Paulo Freire', 19, '2018-02-14', 3),
	(DEFAULT, 'Bell Hooks', 26, '2018-01-05', 3),
	(DEFAULT, 'Christopher Alexander', 85, '2019-06-05', 4),
	(DEFAULT, 'Judith Butler', 45, '2020-05-13', 4),
	(DEFAULT, 'Jorge Amado', 58, '2017-02-17', 4);
    
INSERT INTO SpotifyClone.songs
	(id, song, duration, album_id)
VALUES
	(DEFAULT, 'BREAK MY SOUL', 279, 1),
	(DEFAULT, 'VIRGO’S GROOVE', 369, 1),
	(DEFAULT, 'ALIEN SUPERSTAR', 116, 1),
	(DEFAULT, 'Don’t Stop Me Now', 203, 2),
	(DEFAULT, 'Under Pressure', 152, 3),
	(DEFAULT, 'Como Nossos Pais', 105, 4),
	(DEFAULT, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
	(DEFAULT, 'Samba em Paris', 267, 6),
	(DEFAULT, 'The Bard’s Song', 244, 7),
	(DEFAULT, 'Feeling Good', 100, 8);

INSERT INTO SpotifyClone.reproduction_history
	(reproduction_date, song_id, user_id )
VALUES
	('2022-02-28 10:45:55', 8, 1 ),
	('2020-05-02 05:30:35', 2, 1 ),
	('2020-03-06 11:22:33', 10, 1 ),
	('2022-08-05 08:05:17', 10, 2 ),
	('2020-01-02 07:40:03', 7, 2 ),
	('2020-11-13 16:55:13', 10, 3 ),
	('2020-12-05 18:38:30', 2, 3 ),
	('2021-08-15 17:10:10', 8, 4 ),
	('2022-01-09 01:44:33', 8, 5 ),
	('2020-08-06 15:23:43', 5, 5 ),
	('2017-01-24 00:31:17', 7, 6 ),
	('2017-10-12 12:35:20', 1, 6 ),
	('2011-12-15 22:30:49', 4, 7 ),
	('2012-03-17 14:56:41', 4, 8 ),
	('2022-02-24 21:14:22', 9, 9 ),
	('2015-12-13 08:30:22', 3, 10 );
    
INSERT INTO SpotifyClone.follow_artists
    (user_id, artist_id )
VALUES
	(1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

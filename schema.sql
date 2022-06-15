CREATE DATABASE catalog_of_my_things;

CREATE TABLE genres (
  id int PRIMARY KEY,
  name VARCHAR (255) NOT NULL UNIQUE
);

CREATE TABLE games (
	id int PRIMARY KEY,
  title varchar(255) NOT NULL,
	genre INT,
	publish_date Date NOT NULL,
	archived BOOLEAN,
  multiplayer BOOLEAN NOT NULL,
  last_played_at_date Date NOT NULL,
  CONSTRAINT fk_games_genre
      FOREIGN KEY(genre)
        REFERENCES genres(id)
);

CREATE INDEX genre_index ON games(genre);
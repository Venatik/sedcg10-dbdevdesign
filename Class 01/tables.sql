DROP TABLE IF EXISTS artist_details, song_lyrics, playlist_songs, song_genres, song, playlist, artist, album;

-- Create artist table
CREATE TABLE artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- Query artist table to check if it's been created properly
SELECT * FROM artist

-- Create artist_details table (one-to-one relationship with artist)
CREATE TABLE artist_details (
	id SERIAL PRIMARY KEY,
	date_of_birth DATE,
	full_name VARCHAR(100) NOT NULL,
	country VARCHAR(100),
	city VARCHAR(100),
	is_married BOOLEAN DEFAULT false NOT NULL,
	spouse_name VARCHAR(100),
	artist_id INTEGER UNIQUE REFERENCES artist(id)
);

SELECT * FROM artist_details;

-- Create song table (many-to-one relationship with artist)
CREATE TABLE song (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
	explicit BOOLEAN DEFAULT false NOT NULL,
	artist_id INTEGER REFERENCES artist(id)
);

SELECT * FROM song;

-- Create song_lyrics table (one-to-one relatioship with song)
CREATE TABLE song_lyrics (
	id SERIAL PRIMARY KEY,
	lyrics TEXT NOT NULL,
	song_id INTEGER UNIQUE REFERENCES song(id)
);

SELECT * FROM song_lyrics;

-- Create playlist table
CREATE TABLE playlist (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100)
);

SELECT * FROM playlist;

-- Create playlist_songs table (many-to-many relationship between playlist_songs and song)
CREATE TABLE playlist_songs (
	playlist_id INT REFERENCES playlist(id),
	song_id INT REFERENCES song(id),
	PRIMARY KEY (playlist_id, song_id)
);

SELECT * FROM playlist_songs;

-- Create genre table
CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

SELECT * FROM genre;

-- Create song_genres table (mane-to-many relationship between song and genre)
CREATE TABLE song_genres (
	song_id INT REFERENCES song(id),
	genre_id INT REFERENCES genre(id),
	PRIMARY KEY (song_id, genre_id)
);

SELECT * FROM song_genres;

-- Create album table (many-to-one relationship between album and artist)
CREATE TABLE album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	rating DECIMAL,
	artist_id INT REFERENCES artist(id)
);

SELECT * FROM album;

-- CLEAN TABLES FROM DATA
TRUNCATE TABLE artist_details, song_lyrics, playlist_songs, song_genres, song, playlist, artist, album;

SELECT * FROM album
SELECT * FROM artist
SELECT * FROM artist_details
SELECT * FROM genre
SELECT * FROM playlist
SELECT * FROM playlists_songs
SELECT * FROM song
SELECT * FROM song_lyrics
SELECT * FROM songs_genres

-- Create a temp table to store the details of songs in a specific genre
CREATE TEMP TABLE temp_genre_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit, g.name AS genre_name
FROM song s
JOIN songs_genres sg ON s.id = sg.song_id
JOIN genre g ON sg.genre_id = g.id
WHERE g.name = 'Pop';

SELECT * FROM temp_genre_songs;

-- Create a temp table to store the details of songs from a specific artist
CREATE TEMP TABLE temp_short_artist_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
JOIN artist a ON s.artist_id = a.id
WHERE a.name = 'Eminem';

-- Create a temp table to store the details of songs from a specific artist with duration less than 4 min
CREATE TEMP TABLE temp_short_artist_songs_ed AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
JOIN artist a ON s.artist_id = a.id
WHERE a.name = 'Ed Sheeran' AND EXTRACT(EPOCH FROM s.duration) < 240;

SELECT * FROM temp_short_artist_songs_ed;

-- Create a temp table to store the details of songs from a specific artist
-- JOIN artist on song table
CREATE TEMP TABLE temp_artist_songs AS
SELECT s.id, s.name, s.duration, s.explicit, a.name AS artist_name
FROM song s
JOIN artist a ON s.artist_id = a.id
WHERE a.name = 'Eminem';

-- JOIN song on artist table
CREATE TEMP TABLE temp_artist_songs_test AS
SELECT s.id, s.name, s.duration, s.explicit, a.name AS artist_name
FROM artist a
JOIN song s ON a.id = s.artist_id
WHERE a.name = 'Eminem';

SELECT * FROM temp_artist_songs;
SELECT * FROM temp_artist_songs_test;

-- Create a temp table to store the details of songs with explicit lyrics
CREATE TEMP TABLE temp_explicit_songs AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
WHERE explicit = true;

SELECT * FROM temp_explicit_songs;

-- Create a temp table to store the details of songs with explicit lyrics and duration less than 3 minutes
CREATE TEMP TABLE temp_explicit_short AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
WHERE s.explicit = true AND EXTRACT(EPOCH FROM s.duration) < 180;

-- Create a temp table to store the details of songs with explicit lyrics and duration less than 3 minutes sorted desc
CREATE TEMP TABLE temp_explicit_short_sorted AS
SELECT s.id AS song_id, s.name AS song_name, s.duration, s.explicit
FROM song s
WHERE s.explicit = true AND EXTRACT(EPOCH FROM s.duration) < 180
ORDER BY duration DESC;

SELECT * FROM temp_explicit_short;
SELECT * FROM temp_explicit_short_sorted;
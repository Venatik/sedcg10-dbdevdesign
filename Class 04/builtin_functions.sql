SELECT * FROM album
SELECT * FROM artist
SELECT * FROM artist_details
SELECT * FROM genre
SELECT * FROM playlist
SELECT * FROM playlists_songs
SELECT * FROM song
SELECT * FROM song_lyrics
SELECT * FROM songs_genres

-- Built-in functions
-- Using CONCAT function to concatenate artist name and song name
SELECT CONCAT(a.name, ' - ', s.name) AS artist_song_name
FROM artist a
JOIN song s ON a.id = s.artist_id;

-- Convert all genre names to uppercase
SELECT UPPER(name) AS uppercase_name
FROM genre;

-- Convert album names to lowercase
SELECT LOWER(name) AS lowercase_album_name
FROM album;

-- Extract the first 10 chars of song names
SELECT LEFT(name, 10)
FROM song;

-- Extract the last 5 chars of artist names
SELECT RIGHT(name, 5)
FROM artist;

-- Get the length of song names
SELECT name, LENGTH(name) AS name_length
FROM song;

-- Extract a substring from song names
SELECT SUBSTRING(name FROM 1 FOR 5) AS substring_song_name
FROM song;

-- Remove leading and trailing spaces from artist names
SELECT TRIM(name) AS trimmed_names
FROM artist;

-- Replace null values with 'Unknown' for artist spouse names
SELECT COALESCE(spouse_name, 'Uknown') AS spouse_name, full_name
FROM artist_details;

-- Replace 'e' with 'E' in song names
SELECT REPLACE(name, 'e', 'E')
FROM song;
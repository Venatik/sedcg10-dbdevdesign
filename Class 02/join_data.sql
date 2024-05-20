SELECT * FROM album
SELECT * FROM artist
SELECT * FROM artist_details
SELECT * FROM genre
SELECT * FROM playlist
SELECT * FROM playlist_songs
SELECT * FROM song
SELECT * FROM song_genres
SELECT * FROM song_lyrics

-- List all artists and the song names
SELECT artist.name AS artist_name, song.name AS song_name
FROM artist
JOIN song ON artist.id = song.artist_id;

-- List all artists that are married with their spouse name
SELECT artist.name AS artist_name, artist_details.spouse_name
FROM artist
JOIN artist_details ON artist.id = artist_details.artist_id
WHERE artist_details.is_married = true;

-- List all combinations of song names and genre names
SELECT song.name, genre.name
FROM song
CROSS JOIN genre;

-- List all songs with corresponding artist name
SELECT s.name AS song_name, a.name AS artist_name
FROM song s
LEFT JOIN artist a ON s.artist_id = a.id;
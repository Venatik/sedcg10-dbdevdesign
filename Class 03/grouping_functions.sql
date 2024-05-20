SELECT * FROM album
SELECT * FROM artist
SELECT * FROM artist_details
SELECT * FROM genre
SELECT * FROM playlist
SELECT * FROM playlists_songs
SELECT * FROM song
SELECT * FROM songs_genres
SELECT * FROM song_lyrics

SELECT COUNT(*) as total_artists
FROM artist_details
GROUP BY is_married;

-- Find the min duration of songs in each playlist
SELECT p.title AS playlist, MIN(s.duration) AS min_duration
FROM playlist p
JOIN playlists_songs ps ON p.id = ps.playlist_id
JOIN song s ON ps.song_id = s.id
GROUP BY title;

-- Calculate total duration of songs in each playlist
SELECT p.title AS playlist, SUM(s.duration) AS total_duration
FROM playlist p
JOIN playlists_songs ps ON p.id = ps.playlist_id
JOIN song s ON ps.song_id = s.id
GROUP BY title;

-- Count the number of songs in each album
SELECT al.name AS album, COUNT(s.id) AS song_count
FROM album al
JOIN song s ON al.id = s.album_id
GROUP BY al.name;

-- Find average duration of songs for each artist
SELECT a.id AS artist_id, a.name, AVG(s.duration) AS avg_duration
FROM artist a
LEFT JOIN song s ON a.id = s.artist_id
GROUP BY a.id;

-- Find the total number of songs in each album
SELECT album_id, COUNT(*) AS total_songs
FROM song
GROUP BY album_id;

-- Count the number of explicit songs for each artist
SELECT artist_id, COUNT(*) AS total_explicit_songs
FROM song
WHERE explicit = true
GROUP BY artist_id;

-- Find the number of songs in each genre
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name;

-- Find the sum of all song durations for each artist
SELECT a.name AS artist, SUM(s.duration) AS total_duration
FROM artist a
LEFT JOIN song s ON a.id = s.artist_id
GROUP BY a.name;

-- Count the number of artists in each country
SELECT ad.country, COUNT(a.id) AS total_artists
FROM artist a
LEFT JOIN artist_details ad ON a.id = ad.artist_id
GROUP BY ad.country;

-- Find the total number of songs in each genre including genres with no songs
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name;

-- Find the min and max duration of songs in each genre
SELECT g.name AS genre, MIN(s.duration) AS min_duration, MAX(s.duration) AS max_duration
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
LEFT JOIN song s ON sg.song_id = s.id
GROUP BY g.name;

-- List all songs along with their genres concatenated into a single string
SELECT s.name AS song_name, STRING_AGG(g.name, ', ') AS genres
FROM song s
JOIN songs_genres sg ON s.id = sg.song_id
JOIN genre g ON sg.genre_id = g.id
GROUP BY s.name;

-- Find the maximum rating of albums
SELECT MAX(a.rating) AS max_rating
FROM album a;

-- Find the total duration of all songs
SELECT SUM(s.duration) AS total_duration
FROM song s;
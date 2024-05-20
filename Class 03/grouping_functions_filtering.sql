SELECT * FROM album
SELECT * FROM artist
SELECT * FROM artist_details
SELECT * FROM genre
SELECT * FROM playlist
SELECT * FROM playlists_songs
SELECT * FROM song
SELECT * FROM songs_genres
SELECT * FROM song_lyrics

-- Filter songs by the number of songs in each genre with at least 5 songs
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name
HAVING COUNT(sg.song_id) > 5;

-- Count the number of playlists containing at least 3 songs
SELECT p.title AS playlist_title, COUNT(ps.song_id) AS total_songs
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
GROUP BY p.title
HAVING COUNT(ps.song_id) >= 3;

-- Calculate the total number of songs in each album and display albums with at least 8 songs
SELECT al.name AS album_name, COUNT(s.id) AS total_songs
FROM album al
LEFT JOIN song s ON al.id = s.album_id
GROUP BY al.name
HAVING COUNT(s.id) > 8;

-- Count the number of songs in each genre and display genres with more than 5 songs, sorted by the number of songs in descending order
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name
HAVING COUNT(sg.song_id) >= 5
ORDER BY total_songs DESC;

-- Find the average duration of songs in each playlist and include only playlists with a minimum average duration of at least 5 minutes
SELECT p.title AS playlist_title, AVG(EXTRACT(EPOCH FROM s.duration)) AS avg_duration_seconds
FROM playlist p
LEFT JOIN playlists_songs ps ON p.id = ps.playlist_id
LEFT JOIN song s ON ps.song_id = s.id
GROUP BY p.title
HAVING AVG(EXTRACT(EPOCH FROM s.duration)) >= 300;

-- Count the number of songs in each genre and display genres with more than 5 songs, sorted by descending
SELECT g.name AS genre, COUNT(sg.song_id) AS total_songs
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name
HAVING COUNT(sg.song_id) >= 5
ORDER BY total_songs DESC;
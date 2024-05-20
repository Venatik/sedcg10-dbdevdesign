-- Create a view to display the total duration of songs in each playlist
CREATE VIEW playlist_duration AS
SELECT p.title AS playlist, SUM(s.duration) AS total_duration
FROM playlist p
JOIN playlists_songs ps ON p.id = ps.playlist_id
JOIN song s ON ps.song_id = s.id
GROUP BY p.title;

SELECT * FROM playlist_duration;

-- Create a view to display the number of songs in each genre
CREATE VIEW genre_song_count AS
SELECT g.name AS genre, COUNT(sg.song_id) AS song_count
FROM genre g
LEFT JOIN songs_genres sg ON g.id = sg.genre_id
GROUP BY g.name;

SELECT * FROM genre_song_count
WHERE song_count = 5;
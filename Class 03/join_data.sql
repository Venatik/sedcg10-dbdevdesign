-- Joining tables

-- 1. List all artists and the song names
SELECT
  artist.name AS artist_name,
  song.name AS song_name
FROM artist
JOIN song ON artist.id = song.artist_id;

-- 2. List all artists that are married with their spouse name
SELECT
  artist.name AS artist_name,
  artist_details.spouse_name
FROM artist
JOIN artist_details ON artist.id = artist_details.artist_id
WHERE artist_details.is_married = true;

-- 3. List all combinations of song names and genre names
SELECT
  song.name AS song_name,
  genre.name AS genre_name
FROM song
CROSS JOIN genre;

-- Join Types (Left, Right, Inner, Cross Join, Full Join)

-- 4. Left Join (Retrieve all songs with corresponding artist name)
SELECT s.name AS song_name, a.name AS artist_name
FROM song s
LEFT JOIN artist a ON s.artist_id = a.id;

-- 5. Right Join (Retrieve all artists with corresponding songs)
SELECT a.name AS artist_name, s.name AS song_name
FROM artist a
RIGHT JOIN song s ON a.id = s.artist_id;

-- 6. Cross Join (Retrieve all possible combinations of artists and songs)
SELECT a.name AS artist_name, s.name AS song_name
FROM artist a
CROSS JOIN song s;
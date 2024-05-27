-- Declare a function (get_average_song_duration) for retrieving the avg duration of all existing songs
CREATE OR REPLACE FUNCTION get_average_song_duration()
RETURNS INTERVAL AS $$
DECLARE
avg_duration INTERVAL;
BEGIN
SELECT AVG(duration) INTO avg_duration
FROM song;
RETURN avg_duration;
END;
$$ LANGUAGE plpgsql

SELECT get_average_song_duration() AS average_duration;

-- Declare a function get_artist_song_count that is going to retrieve the number of songs an artist has
CREATE OR REPLACE FUNCTION get_artist_song_count(artist_name VARCHAR)
RETURNS INTEGER AS $$
DECLARE
v_artist_id INTEGER;
song_count INTEGER;
BEGIN
SELECT id INTO v_artist_id
FROM artist
WHERE name = artist_name;

SELECT COUNT(*) INTO song_count
FROM song
WHERE artist_id = v_artist_id;

RETURN song_count;
END;
$$ LANGUAGE plpgsql

SELECT get_artist_song_count('Eminem');
SELECT get_artist_song_count('Ed Sheeran');

-- Declare a function "get_artist_songs" that is going to provide a table as a return value, with information about song name, duration and explicit status, based on provided artist name
CREATE OR REPLACE FUNCTION get_artist_songs(artist_name VARCHAR)
RETURNS TABLE (
	song_name VARCHAR,
	duration INTERVAL,
	explicit BOOLEAN
) AS $$
BEGIN
	RETURN QUERY
	SELECT s.name, s.duration, s.explicit
	FROM song s
	INNER JOIN artist a ON s.artist_id = a.id
	WHERE a.name = artist_name;
END;
$$ LANGUAGE plpgsql;

SELECT get_artist_songs('Eminem');
SELECT * FROM get_artist_songs('Eminem');
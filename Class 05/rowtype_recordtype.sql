-- ROW TYPE
DO $$
DECLARE 
	song_record song%ROWTYPE;
BEGIN
-- Fetching the song details into the row variable
	SELECT *
	INTO song_record
	FROM song
	WHERE id = 1;
	
-- Accessing individual fields of the row variable
	RAISE NOTICE 'Song: %, Artist ID: %, Album ID: %', song_record.name, song_record.artist_id, song_record.album_id;
END;
$$;

-- RECORD TYPE
DO $$
DECLARE
	song_artist_record RECORD;
BEGIN
-- Fetching song and artist details into the record variable
	SELECT s.id AS song_id, s.name AS song_name, a.name AS artist_name
	INTO song_artist_record
	FROM song s
	JOIN artist a ON s.artist_id = a.id
	WHERE s.id = 3;
	
	-- Accessing individual fields of the row variable
	RAISE NOTICE 'Song ID: %, Song ID: %, Artist Name: %', song_artist_record.song_id, song_artist_record.song_name, song_artist_record.artist_name;
END;
$$;

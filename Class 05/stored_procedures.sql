-- Stored procedure to insert a new artist and their details

CREATE OR REPLACE PROCEDURE add_artist_with_details(
	p_name VARCHAR,
	p_date_of_birth DATE,
	p_full_name VARCHAR,
	p_country VARCHAR,
	p_city VARCHAR,
	p_is_married BOOLEAN,
	p_spouse_name VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
	v_artist_id INT;
BEGIN
	-- Insert into artist table and get the artist_id
	INSERT INTO artist (name)
	VALUES (p_name)
	RETURNING id INTO v_artist_id;
	
	-- Insert into artist_details table
	INSERT INTO artist_details (
		date_of_birth,
		full_name,
		country,
		city,
		is_married,
		spouse_name,
		artist_id
	) VALUES (
		p_date_of_birth,
		p_full_name,
		p_country,
		p_city,
		p_is_married,
		p_spouse_name,
		v_artist_id
	);
	
	COMMIT;
END;
$$;

-- Calling the stored procedure
CALL add_artist_with_details('Alicia Keys', '1985-01-01', 'Alicia Igor Keys', 'USA', 'Jacksonville', false, NULL);

-- Check if the data has been written in the relevant tables
SELECT * FROM artist WHERE name = 'Alicia Keys';
SELECT * FROM artist_details WHERE artist_id = 46;



-- Creating a new playlist and inserting list of songs to that playlist
CREATE OR REPLACE PROCEDURE create_playlist_with_songs(
	p_playlist_title VARCHAR,
	p_song_ids INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
	v_playlist_id INT;
	song_id INT;
BEGIN
	-- Insert new playlist and get the playlist ID
	INSERT INTO playlist (title)
	VALUES (p_playlist_title)
	RETURNING id INTO v_playlist_id;
	
	-- Insert songs into the playlist
	FOREACH song_id IN ARRAY p_song_ids
	LOOP
		INSERT INTO playlists_songs (playlist_id, song_id)
		VALUES (v_playlist_id, song_id);
	END LOOP;
	
	EXCEPTION
		WHEN OTHERS THEN
		ROLLBACK;
		RAISE;
		
END;
$$;

CALL create_playlist_with_songs('My Favorite Songs', ARRAY[10, 11, 24]);

SELECT * FROM playlist;
SELECT * FROM playlists_songs WHERE playlist_id = 12;

-- Invalid arguments
CALL create_playlist_with_songs('Invalid Playlist', ARRAY[900, 2500]);


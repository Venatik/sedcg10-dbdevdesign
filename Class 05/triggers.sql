SELECT * FROM song;

-- update_album_rating
-- album_rating_update

-- Step 1: Add the rating field to the song table
ALTER TABLE song
ADD COLUMN rating DECIMAL(2, 1) CHECK (rating >= 1 AND rating <= 5);

-- Step 2: Create the function to add random ratings
CREATE OR REPLACE FUNCTION add_random_rating_to_songs()
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE song
	SET rating = FLOOR(RANDOM() * 5 + 1);
END;
$$;

-- Add random ratings to all songs
SELECT add_random_rating_to_songs();

-- Check if rating column has been populated properly
SELECT * FROM song;

-- Define trigger function
CREATE OR REPLACE FUNCTION update_album_rating()
RETURNS TRIGGER AS $$
BEGIN
	UPDATE album
	SET rating = (
		SELECT AVG(s.rating)
		FROM song s
		WHERE s.album_id = NEW.id
	)
	WHERE id = NEW.id;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER album_rating_update
AFTER INSERT OR UPDATE ON song
FOR EACH ROW
EXECUTE FUNCTION update_album_rating();

-- log_song_changes

-- Create a new table to save audit data
CREATE TABLE IF NOT EXISTS song_audit (
    id SERIAL PRIMARY KEY,
    action VARCHAR(10) NOT NULL,
    song_id INT, -- not adding reference to keep deleted songs
    name VARCHAR(100) NOT NULL,
    duration INTERVAL NOT NULL,
    explicit BOOLEAN NOT NULL
);

-- Creating the function that logs data into the song_audit table
CREATE OR REPLACE FUNCTION log_song_changes()
RETURNS TRIGGER AS $$
BEGIN
	IF TG_OP = 'INSERT' THEN
	INSERT INTO song_audit(action, song_id, name, duration, explicit)
	VALUES ('INSERT', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	
	ELSIF TG_OP = 'UPDATE' THEN
	INSERT INTO song_audit(action, song_id, name, duration, explicit)
	VALUES ('UPDATE', NEW.id, NEW.name, NEW.duration, NEW.explicit);
	
	ELSIF TG_OP = 'DELETE' THEN
	INSERT INTO song_audit(action, song_id, name, duration, explicit)
	VALUES ('DELETE', OLD.id, OLD.name, OLD.duration, OLD.explicit);
	
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger
CREATE TRIGGER song_changes_trigger
AFTER INSERT OR UPDATE OR DELETE ON song
FOR EACH ROW
EXECUTE FUNCTION log_song_changes();

-- Example
INSERT INTO song (name, duration, explicit, artist_id, album_id) VALUES 
('Song 1', '5 minutes 26 seconds', true, 1, 1)

INSERT INTO song (name, duration, explicit, artist_id, album_id) VALUES 
('Song 2', '3 minutes 31 seconds', false, 2, 2)

UPDATE song
SET name = 'Updated song name'
WHERE id = 388;

SELECT * FROM song_audit;
SELECT * FROM album;
SELECT * FROM song;

INSERT INTO song (name, duration, explicit, artist_id, album_id, rating) VALUES
('Song 3', '4 minutes 31 seconds', false, 2, 2, 1)
-- TABLE CONSTRAINTS

-- Default constraint (Set default value for explicit column in song table)
ALTER TABLE song
ALTER COLUMN explicit SET DEFAULT false;

-- All songs must be saved with positive duration
ALTER TABLE song
ADD CONSTRAINT check_duration_positive CHECK (duration >= INTERVAL '0 seconds');

-- All albums must be saved with a positive rating
ALTER TABLE album
ADD CONSTRAINT check_rating_positive CHECK (rating > 0);

-- Unique constraint (Ensure uniqueness of title in playlist)
ALTER TABLE playlist
ADD CONSTRAINT unique_playlist_title UNIQUE (title);

-- Ensure name of each genre is unique
ALTER TABLE genre
ADD CONSTRAINT unique_genre_name UNIQUE (name);

-- Add foreign key constraint to album table referencing artist table
-- Once artist is deleted, all the albums related to the artist are deleted
ALTER TABLE album
ADD CONSTRAINT fk_album_artist_custom
FOREIGN KEY (artist_id)
REFERENCES artist(id)
-- Ensures that if artist is deleted from the artist table, all of their albums will be deleted from the album table.
ON DELETE CASCADE;
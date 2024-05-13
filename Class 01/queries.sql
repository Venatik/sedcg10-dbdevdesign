SELECT * FROM album;
SELECT * FROM genre;

-- Add a column to table
ALTER TABLE album
ADD COLUMN release_date DATE;

SELECT * FROM song;

ALTER TABLE song
RENAME COLUMN explicit to is_explicit;

-- Delete data from table (but not the table itself)
SELECT * FROM song_lyrics;

TRUNCATE TABLE song_lyrics;

-- Delete the entire table
DROP TABLE IF EXISTS song_lyrics;

-- Update rows in a table
SELECT * FROM album

-- Without WHERE everything in the column will be updated
UPDATE album
SET release_date = '2023-05-15'
WHERE id = 1;


SELECT * FROM song
UPDATE song
SET duration = '4 minutes'
WHERE id = 1;
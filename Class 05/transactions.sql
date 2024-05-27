

BEGIN TRANSACTION;

-- Insert new playlist
INSERT INTO playlist(id, title) VALUES (201, 'Favorites');

-- Insert songs into playlist
INSERT INTO playlists_songs(playlist_id, song_id) 
VALUES 
	((SELECT id FROM playlist WHERE title = 'Favorites' LIMIT 1), 1),
	((SELECT id FROM playlist WHERE title = 'Favorites' LIMIT 1), 3),
	((SELECT id FROM playlist WHERE title = 'Favorites' LIMIT 1), 5);
	
-- Commit transaction
COMMIT;

SELECT * FROM playlist;
SELECT * FROM playlists_songs WHERE playlist_id = 201;
-- one to one song and song lyrics
ALTER TABLE song_lyrics
ADD CONSTRAINT fk_song_lyrics_song
FOREIGN KEY (song_id) REFERENCES song(id)

-- Artist and Artist Details (one to one)
ALTER TABLE artist_details
ADD CONSTRAINT fk_artist_details_artist
FOREIGN KEY (artist_id) REFERENCES artist(id)

-- Song and Artist (many to one)
ALTER TABLE song
ADD CONSTRAINT fk_song_artist
FOREIGN KEY (artist_id) REFERENCES artist(id)

-- Album and Artist (many to one)
ALTER TABLE album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (artist_id) REFERENCES artist(id)

-- Song and Playlist (many to many)
ALTER TABLE playlist_songs
ADD CONSTRAINT fk_song_playlist_song
FOREIGN KEY (song_id) REFERENCES song(id);

ALTER TABLE playlist_songs
ADD CONSTRAINT fk_song_playlist_playlist
FOREIGN KEY (playlist_id) REFERENCES playlist(id);

-- Song and Genre (many to many)
ALTER TABLE song_genres
ADD CONSTRAINT fk_song_genre_song
FOREIGN KEY (song_id) REFERENCES song(id);

ALTER TABLE song_genres
ADD CONSTRAINT fk_song_genre_genre
FOREIGN KEY (genre_id) REFERENCES genre(id);
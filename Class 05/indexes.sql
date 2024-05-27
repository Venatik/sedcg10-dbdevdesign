-- Adding Indexes
-- Index on artist table to improve searching by name:
CREATE INDEX idx_artist_name ON artist(name);

SELECT * FROM artist WHERE name = 'Eminem';

-- Index on artist_details
CREATE INDEX idx_artist_details_country_city ON artist_details(country, city);

SELECT * FROM artist_details WHERE country = 'Serbia';
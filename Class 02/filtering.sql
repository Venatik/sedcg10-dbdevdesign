SELECT * FROM artist_details
SELECT * FROM album
SELECT * FROM song

-- Find all artists named 'Eminem'
SELECT * FROM artist WHERE name = 'Eminem'

-- Find all artists whose name starts with M
SELECT * FROM artist WHERE name LIKE 'M%'
-- %m is the reverse process. These are case sensitive.

-- Find all artists whose name ends with s
SELECT * FROM artist WHERE name LIKE '%s'

-- Find all artists from Canada
SELECT * FROM artist_details WHERE country = 'Canada'

-- Find all artist full names from Canada
SELECT full_name, country FROM artist_details WHERE country = 'Canada'

-- Find all married artists from Serbia
SELECT * FROM artist_details WHERE is_married = true AND country = 'Serbia'

-- Find all artists with DoB greater than '01.01.1980'
SELECT * FROM artist_details WHERE date_of_birth > '01.01.1980' AND country = 'USA'

-- Find all explicit songs
SELECT * FROM song WHERE explicit = true

-- Find all lyrics containing the word "can". Make it case insensitive.
SELECT * FROM song_lyrics WHERE LOWER(lyrics) LIKE '%can%'
-- ILIKE makes the query case insensitive
SELECT * FROM song_lyrics WHERE lyrics ILIKE '%can%'

-- Find all albums with a rating greater than 4.5
SELECT * FROM album WHERE rating > 4.5

-- Find all artists married to a person whose name starts with "J"
SELECT * FROM artist_details WHERE spouse_name LIKE 'J%'

-- Find all single artists from "London"
SELECT full_name, city, is_married FROM artist_details WHERE is_married = false AND city = 'London'

-- Find all artist details from USA or England
SELECT * FROM artist_details WHERE country IN('USA', 'England')

-- Select full name and country from artist_details from Serbia, Macedonia and BiH
SELECT full_name, country FROM artist_details WHERE country IN('Serbia', 'Macedonia', 'Bosnia and Herzegovina')
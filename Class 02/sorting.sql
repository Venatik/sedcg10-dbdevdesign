SELECT * FROM artist
ORDER BY name ASC
-- ASC/DESC. Default order is ASCENDING

-- Find all genres sorted by A-Z
SELECT * FROM genre
ORDER BY name

-- Find all albums whose name starts with A sorted by rating
SELECT * FROM album
WHERE name LIKE 'A%'
ORDER BY rating DESC

-- Find all songs ending on O sorted by duration
SELECT * FROM song
WHERE name ILIKE '%o'
ORDER BY duration

-- Find all married artists sorted by spouse name
SELECT * FROM artist_details
WHERE is_married = true
ORDER BY spouse_name ASC

-- Find all artists from USA sorted by city
SELECT * FROM artist_details
WHERE country = 'USA'
ORDER BY city
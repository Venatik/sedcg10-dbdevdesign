-- The UNION operator combines ther esults of two or more SELECT queries, removing duplicates.

-- Combine song names and album names into a single list
-- Will return 77 results
SELECT name FROM song
UNION
SELECT name FROM album

-- The UNION ALL operator combines the results of two or more SELECT queries, including duplicates.
-- List all song names and album names including duplicates
-- Will return 80 results.
SELECT name FROM song
UNION ALL
SELECT name FROM album

-- The INTERSECT operator returns the common rows between two SELECT queries.
-- Find common names between songs and albums
SELECT name from song
INTERSECT
SELECT name FROM album

-- List all unique countries from artist_details and a list of unique cities from the same table
SELECT country AS location FROM artist_details
UNION
SELECT city AS location FROM artist_details

-- List all countries and cities from artist_details including duplicates
SELECT country AS location 
FROM artist_details
UNION ALL
SELECT city AS location 
FROM artist_details

-- List all countries that are also listed as cities in artist_details
SELECT country AS location 
FROM artist_details
INTERSECT
SELECT city AS location 
FROM artist_details
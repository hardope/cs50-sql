CREATE VIEW frequently_reviewed AS
SELECT
    listings.id,
    listings.property_type,
    listings.host_name,
    COUNT(reviews.id) AS reviews
FROM reviews
JOIN listings ON reviews.listing_id = listings.id
GROUP BY listings.id
ORDER BY
    COUNT(reviews.id) DESC,
    listings.property_type ASC,
    listings.host_name ASC
LIMIT 100;
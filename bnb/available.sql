CREATE VIEW available AS
SELECT
    listings.id,
    listings.property_type,
    listings.host_name,
    availabilities.date
FROM availabilities
JOIN listings ON availabilities.listing_id = listings.id
WHERE availabilities.available = 'TRUE';

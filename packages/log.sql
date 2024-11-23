
-- *** The Lost Letter ***
-- Find all letter comming from Anneke's address - single out the congratulatory letter
SELECT * FROM packages WHERE from_address_id = (SELECT id FROM addresses WHERE address = "900 Somerville Avenue");
-- Find the scans of the congratulatory letter
SELECT * FROM scans WHERE package_id = 384;

-- *** The Devious Delivery ***
-- Find the package or packages without a from address
SELECT * FROM packages WHERE from_address_id IS NULL;
-- Find the scans of the package without a from address
SELECT * FROM scans WHERE package_id = 5098;
-- Check what address the package was delivered to
SELECT * FROM addresses where id = 348;

-- *** The Forgotten Gift ***
-- Find packages scheduled for her daugthers location
SELECT * FROM packages WHERE to_address_id = (SELECT id FROM addresses WHERE address = "728 Maple Place");
-- Find the scans of the package scheduled for her daugthers location
SELECT * FROM scans WHERE package_id = 9523;
-- Check what the name of the driver is 
SELECT * FROM drivers WHERE id = 17;


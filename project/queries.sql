-- Insert a new contact into the Contacts table
INSERT INTO Contacts (first_name, last_name, type) 
VALUES ('John', 'Doe', 'individual');

-- Add a phone number for a contact
INSERT INTO Phones (contact_id, phone_number, phone_type) 
VALUES (1, '123-456-7890', 'mobile');

-- Add an email address for a contact
INSERT INTO Emails (contact_id, email_address) 
VALUES (1, 'john.doe@example.com');

-- Add a home address for a contact
INSERT INTO Addresses (contact_id, street, city, state, postal_code, country, address_type) 
VALUES (1, '123 Main St', 'Springfield', 'IL', '62704', 'USA', 'home');

-- Set a preferred contact method for a contact
INSERT INTO PreferredContact (contact_id, preferred_method) 
VALUES (1, 'phone');

-- Retrieve all contact details for a specific contact
SELECT 
    c.first_name,
    c.last_name,
    c.type,
    p.phone_number,
    p.phone_type,
    e.email_address,
    a.street,
    a.city,
    a.state,
    a.postal_code,
    a.country,
    a.address_type,
    pc.preferred_method
FROM 
    Contacts c
LEFT JOIN 
    Phones p ON c.contact_id = p.contact_id
LEFT JOIN 
    Emails e ON c.contact_id = e.contact_id
LEFT JOIN 
    Addresses a ON c.contact_id = a.contact_id
LEFT JOIN 
    PreferredContact pc ON c.contact_id = pc.contact_id
WHERE 
    c.contact_id = 1;

-- Update a phone number for a contact
UPDATE Phones
SET phone_number = '987-654-3210'
WHERE phone_id = 1;

-- Delete an email address for a contact
DELETE FROM Emails
WHERE email_id = 1;

-- List all contacts with their preferred contact method
SELECT 
    c.first_name,
    c.last_name,
    pc.preferred_method
FROM 
    Contacts c
LEFT JOIN 
    PreferredContact pc ON c.contact_id = pc.contact_id;

-- Count the number of contacts by type
SELECT 
    type, 
    COUNT(*) AS count
FROM 
    Contacts
GROUP BY 
    type;

-- Find contacts by last name
SELECT 
    * 
FROM 
    Contacts
WHERE 
    last_name LIKE 'Doe%';

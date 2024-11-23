-- Create the Contacts table
CREATE TABLE IF NOT EXISTS Contacts (
    contact_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    type TEXT CHECK(type IN ('individual', 'business')) NOT NULL
);

-- Create an index for quick lookups by name
CREATE INDEX idx_contacts_name ON Contacts (first_name, last_name);

-- Create the Phones table
CREATE TABLE IF NOT EXISTS Phones (
    phone_id INTEGER PRIMARY KEY AUTOINCREMENT,
    contact_id INTEGER NOT NULL,
    phone_number TEXT NOT NULL,
    phone_type TEXT CHECK(phone_type IN ('mobile', 'home', 'work')) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id)
);

-- Create an index for contact-based phone lookups
CREATE INDEX idx_phones_contact_id ON Phones (contact_id);

-- Create the Emails table
CREATE TABLE IF NOT EXISTS Emails (
    email_id INTEGER PRIMARY KEY AUTOINCREMENT,
    contact_id INTEGER NOT NULL,
    email_address TEXT NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id)
);

-- Create an index for email lookups by contact
CREATE INDEX idx_emails_contact_id ON Emails (contact_id);

-- Create the Addresses table
CREATE TABLE IF NOT EXISTS Addresses (
    address_id INTEGER PRIMARY KEY AUTOINCREMENT,
    contact_id INTEGER NOT NULL,
    street TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    country TEXT,
    address_type TEXT CHECK(address_type IN ('home', 'work')) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id)
);

-- Create an index for address lookups by contact
CREATE INDEX idx_addresses_contact_id ON Addresses (contact_id);

-- Create the PreferredContact table
CREATE TABLE IF NOT EXISTS PreferredContact (
    preferred_id INTEGER PRIMARY KEY AUTOINCREMENT,
    contact_id INTEGER NOT NULL,
    preferred_method TEXT CHECK(preferred_method IN ('phone', 'email', 'address')) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id)
);

-- Create an index for preferred contact lookups by contact
CREATE INDEX idx_preferred_contact_id ON PreferredContact (contact_id);

-- Optional: Create an index for preferred method lookups
CREATE INDEX idx_preferred_method ON PreferredContact (preferred_method);

-- NICE TO HAVE: Views for common queries
-- View to list all contact details (including phones, emails, addresses, and preferred contact methods)
CREATE VIEW v_all_contact_details AS
SELECT 
    c.contact_id,
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
    PreferredContact pc ON c.contact_id = pc.contact_id;

-- View to get a summary of contact counts by type
CREATE VIEW v_contact_counts_by_type AS
SELECT 
    type, 
    COUNT(*) AS count
FROM 
    Contacts
GROUP BY 
    type;

-- View to list all business contacts
CREATE VIEW v_business_contacts AS
SELECT 
    contact_id,
    first_name,
    last_name
FROM 
    Contacts
WHERE 
    type = 'business';

-- View to list all individual contacts
CREATE VIEW v_individual_contacts AS
SELECT 
    contact_id,
    first_name,
    last_name
FROM 
    Contacts
WHERE 
    type = 'individual';

-- View to list all contacts with their preferred contact method
CREATE VIEW v_contacts_with_preferred_method AS
SELECT 
    c.contact_id,
    c.first_name,
    c.last_name,
    pc.preferred_method
FROM 
    Contacts c
LEFT JOIN 
    PreferredContact pc ON c.contact_id = pc.contact_id;

-- View to find contacts with no phone numbers
CREATE VIEW v_contacts_without_phones AS
SELECT 
    c.contact_id,
    c.first_name,
    c.last_name
FROM 
    Contacts c
LEFT JOIN 
    Phones p ON c.contact_id = p.contact_id
WHERE 
    p.phone_id IS NULL;

-- View to find contacts with no email addresses
CREATE VIEW v_contacts_without_emails AS
SELECT 
    c.contact_id,
    c.first_name,
    c.last_name
FROM 
    Contacts c
LEFT JOIN 
    Emails e ON c.contact_id = e.contact_id
WHERE 
    e.email_id IS NULL;

-- View to list all contacts in a specific city
CREATE VIEW v_contacts_by_city AS
SELECT 
    c.contact_id,
    c.first_name,
    c.last_name,
    a.city
FROM 
    Contacts c
LEFT JOIN 
    Addresses a ON c.contact_id = a.contact_id;

-- View to get all addresses labeled as 'work'
CREATE VIEW v_work_addresses AS
SELECT 
    c.contact_id,
    c.first_name,
    c.last_name,
    a.street,
    a.city,
    a.state,
    a.postal_code,
    a.country
FROM 
    Contacts c
LEFT JOIN 
    Addresses a ON c.contact_id = a.contact_id
WHERE 
    a.address_type = 'work';



-- DUMMY DATA
-- Insert dummy data into Contacts table
INSERT INTO Contacts (first_name, last_name, type) VALUES 
('John', 'Doe', 'individual'),
('Jane', 'Smith', 'individual'),
('Acme', 'Corp', 'business'),
('Global', 'Solutions', 'business'),
('Alice', 'Johnson', 'individual'),
('Bob', 'Brown', 'individual');

-- Insert dummy data into Phones table
INSERT INTO Phones (contact_id, phone_number, phone_type) VALUES 
(1, '123-456-7890', 'mobile'),
(1, '098-765-4321', 'work'),
(2, '234-567-8901', 'home'),
(3, '345-678-9012', 'work'),
(4, '456-789-0123', 'mobile'),
(5, '567-890-1234', 'home'),
(6, '678-901-2345', 'work');

-- Insert dummy data into Emails table
INSERT INTO Emails (contact_id, email_address) VALUES 
(1, 'john.doe@example.com'),
(2, 'jane.smith@example.com'),
(3, 'contact@acmecorp.com'),
(4, 'info@globalsolutions.com'),
(5, 'alice.johnson@example.com'),
(6, 'bob.brown@example.com');

-- Insert dummy data into Addresses table
INSERT INTO Addresses (contact_id, street, city, state, postal_code, country, address_type) VALUES 
(1, '123 Main St', 'Springfield', 'IL', '62704', 'USA', 'home'),
(1, '456 Elm St', 'Springfield', 'IL', '62705', 'USA', 'work'),
(2, '789 Oak St', 'Chicago', 'IL', '60616', 'USA', 'home'),
(3, '321 Pine Ave', 'New York', 'NY', '10001', 'USA', 'work'),
(4, '654 Cedar Dr', 'Dallas', 'TX', '75201', 'USA', 'home'),
(5, '987 Maple Ln', 'Los Angeles', 'CA', '90001', 'USA', 'home'),
(6, '111 Birch Rd', 'Miami', 'FL', '33101', 'USA', 'work');

-- Insert dummy data into PreferredContact table
INSERT INTO PreferredContact (contact_id, preferred_method) VALUES 
(1, 'phone'),
(2, 'email'),
(3, 'address'),
(4, 'phone'),
(5, 'email'),
(6, 'address');

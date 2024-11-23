-- Create the database
CREATE DATABASE LinkedInDB;
USE LinkedInDB;

-- Table for users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL
);

-- Table for schools
CREATE TABLE Schools (
    school_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    location VARCHAR(100) NOT NULL,
    year_founded YEAR NOT NULL
);

-- Table for companies
CREATE TABLE Companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    industry ENUM('Technology', 'Education', 'Business') NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Table for user-to-user connections
CREATE TABLE UserConnections (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    FOREIGN KEY (user1_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (user2_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    UNIQUE KEY(user1_id, user2_id) -- Prevent duplicate connections
);

-- Table for user-school affiliations
CREATE TABLE UserSchoolAffiliations (
    affiliation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    school_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    degree VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (school_id) REFERENCES Schools(school_id) ON DELETE CASCADE
);

-- Table for user-company affiliations
CREATE TABLE UserCompanyAffiliations (
    affiliation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    title VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id) ON DELETE CASCADE
);

-- Insert sample data
-- Sample users
INSERT INTO Users (first_name, last_name, username, password)
VALUES ('Claudine', 'Gay', 'claudine', 'password'),
       ('Reid', 'Hoffman', 'reid', 'password');

-- Sample school
INSERT INTO Schools (name, type, location, year_founded)
VALUES ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

-- Sample company
INSERT INTO Companies (name, industry, location)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

-- Sample affiliations
INSERT INTO UserSchoolAffiliations (user_id, school_id, start_date, end_date, degree)
VALUES (1, 1, '1993-01-01', '1998-12-31', 'PhD');

INSERT INTO UserCompanyAffiliations (user_id, company_id, start_date, end_date, title)
VALUES (2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');

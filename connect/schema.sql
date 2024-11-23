-- Users Table
CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL
);

-- Schools and Universities Table
CREATE TABLE IF NOT EXISTS "schools" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL, -- "College", "University"
    "location" TEXT NOT NULL,
    "founded_year" INTEGER
);

-- Companies Table
CREATE TABLE IF NOT EXISTS "companies" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL, -- "Technology", "Finance"
    "location" TEXT NOT NULL
);

-- Connections Between Users (Mutual Connections)
CREATE TABLE IF NOT EXISTS "user_connections" (
    "id" INTEGER PRIMARY KEY,
    "user_id1" INTEGER NOT NULL,
    "user_id2" INTEGER NOT NULL,
    FOREIGN KEY("user_id1") REFERENCES "users"("id"),
    FOREIGN KEY("user_id2") REFERENCES "users"("id"),
    UNIQUE("user_id1", "user_id2"),
    UNIQUE("user_id2", "user_id1")
);

-- Affiliations with Schools
CREATE TABLE IF NOT EXISTS "user_school_affiliations" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE, -- NULL if still attending
    "degree" TEXT, -- "BA", "MA", "PhD"
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

-- Affiliations with Companies
CREATE TABLE IF NOT EXISTS "user_company_affiliations" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE, -- NULL if currently working
    "title" TEXT NOT NULL, -- Job title held
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);

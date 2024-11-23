-- Step 1: Create the raw_meteorites table
DROP TABLE IF EXISTS raw_meteorites;
CREATE TABLE raw_meteorites (
    name TEXT,
    id INTEGER,
    nametype TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year REAL,
    lat REAL,
    long REAL
);

-- Step 2: Import data into raw_meteorites
.mode csv
.import meteorites.csv raw_meteorites

-- Step 3: Create the cleaned meteorites table
DROP TABLE IF EXISTS meteorites;
CREATE TABLE meteorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    class TEXT,
    mass REAL,
    discovery TEXT NOT NULL,
    year INTEGER,
    lat REAL,
    long REAL
);

-- Step 4: Insert cleaned data into the meteorites table
INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
SELECT
    name,
    class,
    ROUND(mass, 2) AS mass,
    discovery,
    CAST(year AS INTEGER) AS year,
    ROUND(lat, 2) AS lat,
    ROUND(long, 2) AS long
FROM
    raw_meteorites
WHERE
    nametype = 'Valid'
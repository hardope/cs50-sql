CREATE TABLE IF NOT EXISTS "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "checkins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "check_in_time" DATETIME DEFAULT current_timestamp,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE IF NOT EXISTS "airlines" (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "flights" (
    "id" INTEGER,
    "airline_id" INTEGER,
    "flight_number" INTEGER,
    "departure_time" DATETIME DEFAULT current_timestamp,
    "arrival_time" DATETIME DEFAULT current_timestamp,
    "departure_airport_code" TEXT,
    "arrival_airport_code" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
-- Ingredients Table
CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "price_per_unit" REAL NOT NULL -- price per unit (e.g., pound, gram)
);

-- Donuts Table
CREATE TABLE IF NOT EXISTS "donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten_free" BOOLEAN NOT NULL,
    "price_per_donut" REAL NOT NULL
);

-- Donut Ingredients Table (Mapping Donuts to Ingredients)
CREATE TABLE IF NOT EXISTS "donut_ingredients" (
    "id" INTEGER PRIMARY KEY,
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    UNIQUE("donut_id", "ingredient_id") -- Ensure no duplicate pairings
);

-- Customers Table
CREATE TABLE IF NOT EXISTS "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);

-- Orders Table
CREATE TABLE IF NOT EXISTS "orders" (
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

-- Order Details Table (Mapping Orders to Donuts and Quantities)
CREATE TABLE IF NOT EXISTS "order_details" (
    "id" INTEGER PRIMARY KEY,
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

-- Step 1: Create the triplets table
CREATE TABLE triplets (
    sentence_id INTEGER,
    start_char INTEGER,
    length INTEGER
);

-- Step 2: Insert the triplets into the table
INSERT INTO triplets (sentence_id, start_char, length)
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

-- Step 3: Create the message view
CREATE VIEW message AS
SELECT
    GROUP_CONCAT(substr(sentences.sentence, triplets.start_char, triplets.length), ' ') AS phrase
FROM
    triplets
JOIN
    sentences ON triplets.sentence_id = sentences.id;

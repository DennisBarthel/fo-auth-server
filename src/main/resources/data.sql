INSERT INTO authority (name)
SELECT * FROM (SELECT 'USER') AS tmp
WHERE NOT EXISTS (
    SELECT name FROM authority WHERE name = 'USER'
) LIMIT 1;

INSERT INTO authority (name)
SELECT * FROM (SELECT 'ADMIN') AS tmp
WHERE NOT EXISTS (
    SELECT name FROM authority WHERE name = 'ADMIN'
) LIMIT 1;
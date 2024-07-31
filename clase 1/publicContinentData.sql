INSERT INTO continent(name) VALUES(
    'North America'),
    ('Asia'),
    ('Africa'),
    ('Europe'),
    ('South America'),
    ('Oceania'),
    ('Antartica');

SELECT DISTINCT continent
FROM country
ORDER BY continent ASC;
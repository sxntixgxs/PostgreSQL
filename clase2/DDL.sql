-- CREATE DATABASE clase2;
-- #\c clase2;

CREATE TABLE country(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL
);
CREATE TABLE depto(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    idCountry INT,
    FOREIGN KEY (idCountry) REFERENCES country(id)
);
CREATE TABLE city(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    idDepto INT NOT NULL,
    FOREIGN KEY (idDepto) REFERENCES depto(id)
);

CREATE TABLE location(
    idDepto INT NOT NULL,
    depto VARCHAR(20) NOT NULL,
    idCity INT NOT NULL,
    city VARCHAR(20) NOT NULL
);

SELECT * FROM location;
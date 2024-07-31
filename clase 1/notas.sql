CREATE TYPE mood AS ENUM('sad','ok','happy');
CREATE TYPE estadocivil AS ENUM ('Casado(a)','Libre','Viudo(a)');

CREATE TABLE person(
    name text,
    current_mood mood
);
INSERT INTO person VALUES('Moe','happy');
SELECT * FROM person;
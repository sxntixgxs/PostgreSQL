CREATE TABLE ejemplo(
    id SERIAL PRIMARY KEY, -- int autoincremental basicamente
    nombre VARCHAR(100) NOT NULL,
    descripcion text,
    precio NUMERIC(10,2) NOT NULL,
    en_stock BOOLEAN NOT NULL,
    fecha_creacion DATE NOT NULL,
    hora_creacion TIME NOT NULL,
    fecha_hora TIMESTAMP NOT NULL, -- fecha y hora sin huso horario
    fecha_hora_zona TIMESTAMP WITH TIME ZONE, -- fecha con zona horaria
    duracion INTERVAL, -- periodo de tiempo
    direccion_ip INET, -- direccion ip
    direccion_mac MACADDR, -- direccion mac
    punto_geometrico POINT, -- punto en un plano de dos dimensiones
    datos_json JSON, -- json datos en formato JSON
    datos_jsonb JSONB, -- datos json en un formato binario, más eficiente
    identificador_unico UUID, -- identificador unico universal
    estado_monetario MONEY, -- cantidad monetaria
    rangos INT4RANGE, -- rango de valores
    colores_preferidos VARCHAR(20)[] -- arreglo de cadenas
);

-- Ejemplo de tipo ENUM

CREATE TYPE estadocivil AS ENUM('Casado','Soltero','Viudo');
CREATE TYPE estadopedido AS ENUM('pendiente','en_proceso','completado','cancelado');

CREATE TABLE pedidos(
    id SERIAL PRIMARY KEY,
    estado estadopedido NOT NULL --conjunto de valores declarados arriba!
);

-- creacion de tipo compuesto
CREATE TYPE direccion_completa AS (
    calle VARCHAR,
    ciudad VARCHAR,
    codigo_postal INTEGER
);

CREATE TABLE clientes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    epedido estadopedido,
    direccion direccion_completa -- tipo compuesto
);

-- insertar datos
-- tabla ejemplo
INSERT INTO ejemplo(
    nombre,descripcion,precio,en_stock,fecha_creacion,hora_creacion,fecha_hora,fecha_hora_zona,duracion,direccion_ip,direccion_mac,punto_geometrico,datos_json,datos_jsonb,identificador_unico,estado_monetario,rangos,colores_preferidos
)VALUES(
    'Producto A','Descripcion del producto A',29.99,true,'2024-07-09','14:30:00','2024-07-09 14:30:00','2024-07-09 14:30:00+00','1 day','192.168.1.1','08:00:27:00:00:00','(10,20)','{"key":"value"}','{"key":"value"}','550e8400-e29b-41d4-a716-446655440000','100.00','[10,20)',ARRAY['rojo','verde','azul']
);
-- tabla pedidos
INSERT INTO pedidos(estado) VALUES ('pendiente');
-- tabla clientes
INSERT INTO clientes(direccion) VALUES (ROW('Calle Falsa 123','Springfield',12345));

CREATE TABLE empleados(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INTEGER NOT NULL,
    salario NUMERIC(10,2),
    fecha_contratacion DATE,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE country(
    id SERIAL,
    name VARCHAR(50)
);
ALTER TABLE country ADD PRIMARY KEY (id);

CREATE TABLE region(
    id serial,
    name vARCHAR(50),
    idcountry INTEGER
);
ALTER TABLE region ADD PRIMARY KEY (id);
ALTER TABLE region ADD CONSTRAINT fk_region_country FOREIGN KEY (idcountry) REFERENCES country(id);

CREATE TABLE city(
    id SERIAL,
    name VARCHAR(50),
    idregion INTEGER
);
ALTER TABLE city ADD PRIMARY KEY (id);
ALTER TABLE city ADD CONSTRAINT fk_city_region FOREIGN KEY (idregion) REFERENCES region(id);

DROP TABLE city;
DROP TABLE region;
DROP TABLE country;

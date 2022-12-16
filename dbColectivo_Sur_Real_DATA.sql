/* Creamos la base de datos */
DROP DATABASE IF EXISTS Colectivo_Sur_Real;
CREATE DATABASE Colectivo_Sur_Real;
USE Colectivo_Sur_Real;

/* Creamos la tabla CLIENTE*/
DROP TABLE IF EXISTS Logeo;
CREATE TABLE Logeo 
(
  username varchar(50) NOT NULL,
  password varchar(255) NOT NULL
);


INSERT INTO Logeo 
(username, password) 
VALUES
('amir.arbieto@vallegrande.edu.pe', 'vg2022'),
('maylin.jauregui@vallegrande.edu.pe', 'vg2022');

SELECT * FROM Logeo;


/* Creamos la tabla Usuario*/
DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario 
 (
    ID_USER INT AUTO_INCREMENT NOT NULL,
    NOM_USER VARCHAR(50),
    APE_USER VARCHAR(80),
    GMA_USER VARCHAR(100),
    CEL_USER CHAR(9),
    PRO_USER VARCHAR(100),
    LDP_USER VARCHAR(100),
    EST_USER CHAR(1) DEFAULT 'A',
    PRIMARY KEY (ID_USER)
);

/* Valores unicos */
ALTER TABLE Usuario
	ADD CONSTRAINT ID_USER_UNICO UNIQUE(ID_USER);
ALTER TABLE Usuario
	ADD CONSTRAINT GMA_USER_UNICO UNIQUE(GMA_USER);
    
/* Valores Validos */
ALTER TABLE Usuario
	ADD CONSTRAINT CEL_USER_VALIDO CHECK(CEL_USER REGEXP '^[0-9]{9}');
    
ALTER TABLE Usuario
	ADD CONSTRAINT GMA_USER_VALIDO CHECK(GMA_USER LIKE '%_@%_._%');

ALTER TABLE Usuario
	ADD CONSTRAINT EST_USER_VALIDO CHECK(EST_USER = 'A' OR EST_USER = 'I');
    
/* Insertar Registros de la tabla CLIENTE */
INSERT INTO Usuario
(NOM_USER, APE_USER, GMA_USER, CEL_USER, PRO_USER, LDP_USER)
VALUES 
('Eugenio', 'Barrios Palomino', 'eugenio@yahoo.com', '984512119', 'Albañil', 'Perú'),
('Sebastian', 'Campos Rodriguez', 'sebastian@yahoo.com', '987217859', 'Secretariado', 'Perú'),
('Carolina', 'Martines Fernandez', 'carolina@yahoo.com', '977467859', 'Mecanica', 'Perú');

/* Ordenar Registros*/
SELECT
    CONCAT('U', ID_USER) AS 'Identificador',
	CONCAT(UPPER(NOM_USER), ', ', APE_USER) AS 'Usuario',
	GMA_USER AS 'Email',
    CEL_USER AS 'Celular',
    PRO_USER AS 'Profesión',
    LDP_USER AS 'Lugar de procedencia',
    CASE
    WHEN EST_USER = 'A' THEN 'Activo'
    WHEN EST_USER = 'I' THEN 'Inactivo'
    ELSE 'No Registrado'
	END AS 'Estado del usuario' 
FROM Usuario;
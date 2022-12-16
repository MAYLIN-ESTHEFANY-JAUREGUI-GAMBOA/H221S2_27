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
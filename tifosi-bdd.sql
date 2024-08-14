
CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;


GRANT ALL PRIVILEGES ON *.* TO `tifosi`@`%` IDENTIFIED BY PASSWORD '*A6577FAF1785D1662EB500E524BB06CFE0B27FDB' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `tifosi`.* TO `tifosi`@`%`;



CREATE TABLE IF NOT EXISTS client (
  id_client INT AUTO_INCREMENT PRIMARY KEY,
  nom_client VARCHAR(45) NOT NULL,
  age INT NOT NULL,
  cp_client INT NOT NULL
);

CREATE TABLE IF NOT EXISTS focaccia (
  id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
  nom_focaccia VARCHAR(45) NOT NULL,
  prix_focaccia FLOAT NOT NULL
);


CREATE TABLE IF NOT EXISTS ingredient (
  id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
  nom_ingredient VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS menu (
  id_menu INT AUTO_INCREMENT PRIMARY KEY,
  nom_menu VARCHAR(45) NOT NULL,
  prix_menu FLOAT NOT NULL,
  id_focaccia INT NOT NULL,
  FOREIGN KEY (id_focaccia) REFERENCES focaccia (id_focaccia)
);

CREATE TABLE IF NOT EXISTS boisson (
  id_boisson INT AUTO_INCREMENT PRIMARY KEY,
  nom_boisson VARCHAR(45) NOT NULL,
  id_marque INT NOT NULL,
  FOREIGN KEY (id_marque) REFERENCES marque (id_marque)
);


CREATE TABLE IF NOT EXISTS marque (
  id_marque INT AUTO_INCREMENT PRIMARY KEY,
  nom_marque VARCHAR(45) NOT NULL
);


CREATE TABLE IF NOT EXISTS achete (
  id_client INT NOT NULL,
  id_focaccia INT NOT NULL,
  jour DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_client, id_focaccia),
  FOREIGN KEY (id_client) REFERENCES client (id_client),
  FOREIGN KEY (id_focaccia) REFERENCES focaccia (id_focaccia)
);


CREATE TABLE IF NOT EXISTS comprend (
  id_focaccia INT NOT NULL,
  id_ingredient INT NOT NULL,
  PRIMARY KEY (id_focaccia, id_ingredient),
  FOREIGN KEY (id_focaccia) REFERENCES focaccia (id_focaccia),
  FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient)
);


CREATE TABLE IF NOT EXISTS contient (
  id_menu INT NOT NULL,
  id_boisson INT NOT NULL,
  PRIMARY KEY (id_menu, id_boisson),
  FOREIGN KEY (id_boisson) REFERENCES boisson (id_boisson),
  FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
);


CREATE TABLE IF NOT EXISTS paye (
  id_client INT NOT NULL,
  id_menu INT NOT NULL,
  jour DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_client, id_menu),
  FOREIGN KEY (id_client) REFERENCES client (id_client),
  FOREIGN KEY (id_menu) REFERENCES menu (id_menu)
);

ALTER USER 'root'@'localhost' IDENTIFIED BY 'Karmitelagrenouilledu69';
CREATE USER 'configomatic'@'%' IDENTIFIED BY 'Karmitelagrenouilledu69';
CREATE DATABASE configomatic;
GRANT ALL PRIVILEGES ON configomatic.* TO 'configomatic'@'%';
ALTER USER 'configomatic'@'%' IDENTIFIED WITH mysql_native_password BY 'Karmitelagrenouilledu69';

USE configomatic;

CREATE TABLE `ordinateur` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `processeur` int,
  `carte_mere` int,
  `memoire` int,
  `carte_graphique` int,
  `disque_dur` int,
  `prix` double,
  `vendu` boolean,
  `datetime_creation` datetime,
  `datetime_vendu` datetime
);

CREATE TABLE `processeur` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `prix` double,
  `nombre_coeurs` int,
  `fabricant` int
);

CREATE TABLE `carte_mere` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `prix` double,
  `compatibilite_usbc` boolean,
  `port_pci_express` boolean,
  `fabricant` int
);

CREATE TABLE `carte_graphique` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `prix` double,
  `memoire_graphique_go` int,
  `puissance_tflops` double,
  `fabricant` int
);

CREATE TABLE `disque_dur` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `prix` double,
  `capacite_go` int,
  `fabricant` int
);

CREATE TABLE `memoire` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `prix` double,
  `capacite_go` int,
  `type` varchar(255),
  `fabricant` int
);

CREATE TABLE `fabricant` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255)
);

ALTER TABLE `disque_dur` ADD FOREIGN KEY (`fabricant`) REFERENCES `fabricant` (`id`);

ALTER TABLE `carte_graphique` ADD FOREIGN KEY (`fabricant`) REFERENCES `fabricant` (`id`);

ALTER TABLE `memoire` ADD FOREIGN KEY (`fabricant`) REFERENCES `fabricant` (`id`);

ALTER TABLE `processeur` ADD FOREIGN KEY (`fabricant`) REFERENCES `fabricant` (`id`);

ALTER TABLE `carte_mere` ADD FOREIGN KEY (`fabricant`) REFERENCES `fabricant` (`id`);

ALTER TABLE `ordinateur` ADD FOREIGN KEY (`carte_mere`) REFERENCES `carte_mere` (`id`);

ALTER TABLE `ordinateur` ADD FOREIGN KEY (`processeur`) REFERENCES `processeur` (`id`);

ALTER TABLE `ordinateur` ADD FOREIGN KEY (`memoire`) REFERENCES `memoire` (`id`);

ALTER TABLE `ordinateur` ADD FOREIGN KEY (`carte_graphique`) REFERENCES `carte_graphique` (`id`);

ALTER TABLE `ordinateur` ADD FOREIGN KEY (`disque_dur`) REFERENCES `disque_dur` (`id`);


-- Fabricants :
INSERT INTO fabricant (nom) VALUES ('Intel');
INSERT INTO fabricant (nom) VALUES ('AMD');
INSERT INTO fabricant (nom) VALUES ('Apple');
INSERT INTO fabricant (nom) VALUES ('HP');
INSERT INTO fabricant (nom) VALUES ('Dell');
INSERT INTO fabricant (nom) VALUES ('Lenovo');
INSERT INTO fabricant (nom) VALUES ('Asus');
INSERT INTO fabricant (nom) VALUES ('Nvidia');
INSERT INTO fabricant (nom) VALUES ('Micron');
INSERT INTO fabricant (nom) VALUES ('Seagate');
INSERT INTO fabricant (nom) VALUES ('Corsair');
INSERT INTO fabricant (nom) VALUES ('Crucial');

-- Cartes graphiques :
-- Nvidia
INSERT INTO carte_graphique(nom, prix, memoire_graphique_go, puissance_tflops,  fabricant) VALUES ('GTX', 200, 8, 8.873, 8);
INSERT INTO carte_graphique(nom, prix, memoire_graphique_go, puissance_tflops,  fabricant) VALUES ('Turbo GTX', 400, 8, 12.873, 8);
INSERT INTO carte_graphique(nom, prix, memoire_graphique_go, puissance_tflops,  fabricant) VALUES ('Titan RTX', 900, 16, 16.572, 8);

-- AMD
INSERT INTO carte_graphique(nom, prix, memoire_graphique_go, puissance_tflops,  fabricant) VALUES ('Radeon RX 1', 450, 8, 8.572, 2);
INSERT INTO carte_graphique(nom, prix, memoire_graphique_go, puissance_tflops,  fabricant) VALUES ('Radeon RX 2', 690, 16, 16.572, 2);

-- Cartes meres :
-- Asus
INSERT INTO carte_mere(nom, prix, compatibilite_usbc, port_pci_express,  fabricant) VALUES ('Medium', 100, true, false , 7);
INSERT INTO carte_mere(nom, prix, compatibilite_usbc, port_pci_express,  fabricant) VALUES ('High', 300, true, true, 7);

-- Dell
INSERT INTO carte_mere(nom, prix, compatibilite_usbc, port_pci_express,  fabricant) VALUES ('Medium', 130, true, false , 5);

-- Disques durs :
-- Segate
INSERT INTO disque_dur(nom, prix, capacite_go,  fabricant) VALUES ('HDD 1',40,500,10);
INSERT INTO disque_dur(nom, prix, capacite_go,  fabricant) VALUES ('HDD 2',110,1000,10);
INSERT INTO disque_dur(nom, prix, capacite_go,  fabricant) VALUES ('HDD 3',200,2000,10);

-- Micron
INSERT INTO disque_dur(nom, prix, capacite_go,  fabricant) VALUES ('SSD 1', 70, 128, 9);
INSERT INTO disque_dur(nom, prix, capacite_go,  fabricant) VALUES ('SSD 2', 150, 256, 9);
INSERT INTO disque_dur(nom, prix, capacite_go,  fabricant) VALUES ('SSD 3', 300, 1000, 9);

-- Memoire :
-- RAM Corsair
INSERT INTO memoire(nom, prix, capacite_go, type,  fabricant) VALUES ('Corsair x', 100, 8, 'DDR3', 11);
INSERT INTO memoire(nom, prix, capacite_go, type,  fabricant) VALUES ('Corsair y', 120, 8, 'DDR4', 11);
INSERT INTO memoire(nom, prix, capacite_go, type,  fabricant) VALUES ('Corsair Z', 200, 16, 'DDR4', 11);

-- RAM Crucial
INSERT INTO memoire(nom, prix, capacite_go, type,  fabricant) VALUES ('CT8G4SFRA32A', 40, 8, 'DDR3', 12);
INSERT INTO memoire(nom, prix, capacite_go, type,  fabricant) VALUES ('CT16G4SENA16B', 120, 8, 'DDR4', 12);

-- Processeur :
-- Processeurs Intel :
INSERT INTO processeur (nom, prix, nombre_coeurs,  fabricant) VALUES ('Core i3', 100, 2, 1);
INSERT INTO processeur (nom, prix, nombre_coeurs,  fabricant) VALUES ('Core i5', 250, 4, 1);
INSERT INTO processeur (nom, prix, nombre_coeurs,  fabricant) VALUES ('Core i7', 400, 6, 1);
INSERT INTO processeur (nom, prix, nombre_coeurs,  fabricant) VALUES ('Core i9', 500, 8, 1);

-- Processeurs AMD :
INSERT INTO processeur (nom, prix, nombre_coeurs,  fabricant) VALUES ('Ryzen 5', 100, 2, 2);
INSERT INTO processeur (nom, prix, nombre_coeurs,  fabricant) VALUES ('Ryzen 7', 200, 4, 2);
INSERT INTO processeur (nom, prix, nombre_coeurs,  fabricant) VALUES ('Ryzen 9', 300, 8, 2);

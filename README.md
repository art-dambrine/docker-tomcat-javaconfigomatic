# docker-tomcat-javaconfigomatic
Example project for Docker Tomcat deployment with project JEE JavaConfigomatic

Une fois les etapes d'installation effectuée rendez vous à l'URL : http://MONSITE:PORT/JavaConfigomatic/

## Etapes d'installation

1. Changer les identifiants
```
<Resource name="jdbc/JavaConfigomaticDB" auth="Container" type="javax.sql.DataSource"
               maxTotal="10" maxIdle="3" maxWaitMillis="10000"
               username="USERNAME" password="PASSWORD" driverClassName="com.mysql.cj.jdbc.Driver"
               url="jdbc:mysql://URL:PORT/NOM_BASE"/>
```

2. Lancer le script d'installation
```
$ ./run-container.sh
```
NOTE : si besoin changer le port et le nom du container etc... dans `run-container.sh`


3. Assurez vous d'avoir une base de données MySQL avec les tables suivantes
```
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

```

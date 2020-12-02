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
$ ./run-stack.sh
```
NOTE : si besoin changer le port et le nom du container etc... dans `run-container.sh`


3. Une fois le service mysql installé et en fonction lancer la commande suivante
```
$ ./post-install-mysql.sh
```

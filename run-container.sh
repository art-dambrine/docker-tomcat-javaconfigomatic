docker stop tomcat-docker
docker rm tomcat-docker
docker rmi tomcat-projet-img
docker build -t tomcat-projet-img .

docker run -d --name tomcat-docker -p 8777:8080 --restart=always -v WAR:/usr/local/tomcat/webapps tomcat-projet-img:latest


docker stop tomcat-docker
docker rm tomcat-docker
docker rmi tomcat-projet-img
docker build -t tomcat-projet-img .

docker volume create tomcat_data
docker run -d --name tomcat-docker -p 8777:8080 --restart=always -v tomcat_data:/usr/local/tomcat tomcat-projet-img:latest

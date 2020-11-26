docker build -t tomcat-projet-img .
docker run -it --name tomcat-docker --rm -p 8777:8080 tomcat-projet-img:latest

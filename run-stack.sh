# Stop containers
docker stop tomcat-configomatic
docker stop mysql-configomatic
# Rm containers
docker rm tomcat-configomatic
docker rm mysql-configomatic
# Rm custom tomcat image
docker rmi tomcat-configomatic-img
# Build new tomcat image
docker build -t tomcat-configomatic-img .
# Compose
docker-compose up -d



FROM tomcat:8.5
COPY lib /usr/local/tomcat/lib/
COPY context.xml /usr/local/tomcat/conf/context.xml

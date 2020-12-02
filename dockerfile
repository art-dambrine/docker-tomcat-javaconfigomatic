FROM tomcat:9.0
COPY lib /usr/local/tomcat/lib/
COPY context.xml /usr/local/tomcat/conf/context.xml

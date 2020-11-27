FROM tomcat:9.0
COPY lib /usr/local/tomcat/lib/
COPY JavaConfigomatic.war /usr/local/tomcat/webapps/JavaConfigomatic.war
RUN mv /usr/local/tomcat/webapps/JavaConfigomatic.war /usr/local/tomcat/webapps/ROOT.war
COPY context.xml /usr/local/tomcat/conf/context.xml

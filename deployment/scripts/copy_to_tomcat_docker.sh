# Get machines env-variables
docker-machine env tiesu
eval $(docker-machine env tiesu)

# Copy war
docker cp ../../target/TiesuUI.war tomcat:/usr/local/tomcat/webapps/tiesu.war

# Wait 5s (Give tomcat time to unpack war)
sleep 5s

# Copy configs
docker cp config.properties tomcat:/usr/local/tomcat/webapps/tiesu/WEB-INF/classes/
docker cp hibernate.cfg.xml tomcat:/usr/local/tomcat/webapps/tiesu/WEB-INF/classes/

# Restart tomcat container
docker restart tomcat
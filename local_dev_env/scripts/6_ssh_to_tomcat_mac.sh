# Get machines env-variables
docker-machine env tiesu
eval $(docker-machine env tiesu)

# Ssh to tomcat
docker exec -t -i tomcat /bin/bash

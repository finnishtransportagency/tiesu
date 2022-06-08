# Get machines env-variables
& docker-machine env tiesu | Invoke-Expression

# Ssh to tomcat
docker exec -t -i tomcat /bin/bash

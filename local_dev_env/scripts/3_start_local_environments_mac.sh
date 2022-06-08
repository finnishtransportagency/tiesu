# Start docker-machine
docker-machine start tiesu

# Get machines env-variables
docker-machine env tiesu
eval $(docker-machine env tiesu)

# Start Oracle container
docker start oracle-xe

# Start Tomcat container
docker start tomcat

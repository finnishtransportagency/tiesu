FROM node:12-alpine as BUILD_FRONTEND

RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/webapp

WORKDIR /usr/src/app

COPY ./src/main/app /usr/src/app

RUN npm rebuild node-sass
RUN npm ci
RUN npm run build

RUN rm -rf ../webapp/build/*
RUN cp -r build/* ../webapp/
# rm -rf build
# COPY . /usr/src/app
#Tomcat 7 poimittu projektin pom:sta ja openjdk8 confluencesta tuotannon ajoympariston kuvauksesta
FROM maven:3.6.0-jdk-11-slim AS BUILD_BACKEND

COPY ./src/main/java /data/src/main/java/
COPY ./src/main/resources /data/src/main/resources/
RUN rm /data/src/main/resources/hibernate.cfg.xml
RUN mv  /data/src/main/resources/hibernate.cfg.docker.xml /data/src/main/resources/hibernate.cfg.xml
COPY pom.xml /data/
COPY ./src/main/webapp/WEB-INF /data/src/main/webapp/WEB-INF/


#Copy frontend
COPY --from=BUILD_FRONTEND /usr/src/webapp /data/src/main/webapp
RUN cd /data && mvn clean install -Dmaven.test.skip=true

FROM tomcat:7-jdk8-openjdk

RUN mkdir ${CATALINA_HOME}/webapps/tiesu

COPY --from=BUILD_BACKEND /data/target/TiesuUI.war ${CATALINA_HOME}/webapps/tiesu.war
RUN unzip ${CATALINA_HOME}/webapps/tiesu.war -d ${CATALINA_HOME}/webapps/ROOT

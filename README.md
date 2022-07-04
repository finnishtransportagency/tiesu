## Deployment instructions in tiesu/deployment/README

## Create complete deployable package (You only need to read steps in this topic)
In tiesu/ folder run 'sh build.sh

## Prerequisites for the frontend development

* Node.js - http://nodejs.org/
* Git - http://git-scm.com/

## Usage

### Install frontend

```
cd src/main/app
npm install
```

### Run frontend

```
npm run start
```

http://localhost:8000

### Build frontend

Optimizes resources

```
npm run build
```

NOTE: Build frontend every time before maven build when frontend-project has changed.

To build maven project, run:

```
mvn clean install
``

## Backend
## Backend requires ojdbc6 manual maven installation because of Oracle's licensing policy.
# mvn install:install-file -Dfile=tiesu/lib/ojdbc6.jar -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0.3 -Dpackaging=jar 

## Create test data to database (location in Java Dao folders tiesu/src/main/java/fi/liike/rest/Dao/sql/
## 1. Run create_user.sql with DB admin rights. Use sqldeveloper or something else.
## 2. Run main_install.sql with DB admin or tiesu user rights.
## 3. Commit. => Necessary data for Järjestelmäsalkku should be available

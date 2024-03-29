# Database management

Database is updated using [dbmaintain-maven-plugin ](http://www.dbmaintain.org/maven-goals.html). All files placed in src/sql/database/ are executed in sql-server.
All updates are incremential - only new files ale executed. Therefore you can insert files to folder with biggest ordernumber.

Create new folder for new development iteration (for example folder/version). Sql-filename must begin with ordernumber, you can skip numbers but you cannot later add files with lower number (for example 03-add-user.sql after 05-add-group.sql is not allowed - next file must be 06 or bigger).

## Initializing database

Folder "01_tables_initial" contains scripts that initialize database to the state which livi's production db was prior to this project.

-   When setting up a new db e.g. for local development these files are required.
-   When converting existing db remove these files before running upgrade script.
-   Scripts in folders 02-04 modify db as expected by tiesu application
-   "revertTiesuConversion.sql" contains everything to revert all changes made by scripts in folders 02-04. This file is not seen by dbmaintain and should be run by hand if needed.

## Updating database

Execute all files added after last update.

Run command `./updateDatabase.sh`

## Updating test environments database

-   Fill database username & password to dbmaintain_livi_testi.properties (if you haven't already done that). **DO NOT STORE PASSWORDS IN GIT**. Password is stored in [CRED-811](https://jira.solita.fi/browse/CRED-811).
-   Open VPN connection [https://etayhteys.liikennevirasto.fi/vpn/index.html](https://etayhteys.liikennevirasto.fi/vpn/index.html)
-   Open ssh-tunnel to test-env
-   `ssh -L1530:10.129.46.171:1521 <yourKaccount>@172.17.204.73`
-   Run updatescript `updateDatabaseLiviTesti.sh`

## Updating production environments database

-   Fill database username & password to dbmaintain_livi_tuotanto.properties (if you haven't already done that). **DO NOT STORE PASSWORDS IN GIT**. Password is stored in [CRED-811](https://jira.solita.fi/browse/CRED-811).
-   Open VPN connection [https://etayhteys.liikennevirasto.fi/vpn/index.html](https://etayhteys.liikennevirasto.fi/vpn/index.html)
-   Open ssh-tunnel
-   `ssh -L1535:10.129.47.76:1521 <yourKaccount>@172.17.201.21`
-   Run updatescript `updateDatabaseLiviTuotanto.sh`

## Deleting all data from local database

**WARNING: THIS DELETES ALL YOUR TABLES AND DATA**

Run command `./clearDatabase.sh`

## Inserting test-data to database

Execute **insert_testdata.sql** using SQL Developer (or any other sql-client)

## Problemsolving

You tried to execute malformed sql? Execution failed because constraints? etc. Remove failed file from logs running command `./markErrorReverted.sh`

Want run last 10 files again?
Remove lines from DBMAINTAIN_SCRIPTS -table.
Note that you have still revert those changes manually (for example remove created tables).

You tried update database and got **ORA-00054: resource busy and acquire with NOWAIT specified or timeout expired** -error?
Disconnect your Sql-clint and try again.

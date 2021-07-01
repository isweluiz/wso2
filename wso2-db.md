# Working with Databases

WSO2 API Manager is shipped with an H2 database for storing data. These default databases are located in the <API-M_HOME>/repository/database directory of the product pack.

### Default databases

Explained below are the default databases which will be used within API Manager.

- AM database :WSO2AM_DB.mv.db WSO2 API Manager has this database keeping its specific API-M related data.
- Shared database :WSO2SHARED_DB.mv.db This database contains the registry and user management data.
- Carbon database: WSO2CARBON_DB.mv.db This database has the internal data related to the product. This data is stored in the embedded H2 database.

The following image shows the default databases and the data that are stored in each database.

![DATABASEAPIM](https://apim.docs.wso2.com/en/3.2.0/assets/img/setup-and-install/working-with-dbs-overview.png)

The embedded H2 databases shipped with your product are suitable for development and testing environments. However, for production environments, it is recommended to use an industry-standard RDBMS such as Oracle, PostgreSQL, MySQL, MS SQL, etc.

WSO2 products are shipped with scripts for creating the required tables in all the required databases: The scripts for creating tables for API-M, user management, and registry data are stored in the <API-M_HOME>/dbscripts directory

Changing the default database: You simply have to set up new physical databases, point the product server to the new databases by updating the relevant configuration files, and create the required tables using the scripts provided in the product pack. See the following topics for instructions:


## Setting up MySQL¶

The following sections describe how to set up a MySQL database to replace the default H2 database in your WSO2 product:

- [Setting up the database and users](https://apim.docs.wso2.com/en/3.2.0/install-and-setup/setup/setting-up-databases/changing-default-databases/changing-to-mysql/#setting-up-the-database-and-users)
- [Setting up the drivers](https://apim.docs.wso2.com/en/3.2.0/install-and-setup/setup/setting-up-databases/changing-default-databases/changing-to-mysql/#setting-up-the-drivers)
- [Executing DB scripts to create tables on MySQL database](https://apim.docs.wso2.com/en/3.2.0/install-and-setup/setup/setting-up-databases/changing-default-databases/changing-to-mysql/#executing-db-scripts-to-create-tables-on-mysql-database)


## Configure database for AIPIM 3.2 

Install DB 
```bash
[root@ip-172-31-16-21 centos]# yum install mariadb-server
```

Create a new place for store mysql data

```bash
[root@ip-172-31-16-21 centos]# mkdir -pv /data/wso2
```

Defining permissions for mysql user
```bash
[root@ip-172-31-16-21 /]# vim /etc/my.cnf
```


Edit configuration file and change the 
```bash
[root@ip-172-31-16-21 /]# vim /etc/my.cnf
```

Change parameter datadir 
```yml
[mysqld]
datadir=/data/wso2
```

## Disable SElinux 

```bash
setenforce 0 
vim /etc/selinux/config 
```

## Setting Up the Database and Users:
-  Start MySQL command-line client and enter the password that you had provided while installing. 

systemctl start mariadb 

- Create the apim database “WSO2AM_DB” and registry and user manager database         “WSO2SHARED_DB” using the below commands.

```bash
create database wso2am_db;  
create database wso2shared_db; 
```

- Create and give authorization to a user named “wso2carbon” using the below commands for accessing the above-created databases.
 
 ```bash
create user 'wso2carbon'@'localhost' identified by 'wso2carbon';
grant all on wso2am_db.* TO 'wso2carbon'@'localhost';
grant all on wso2shared_db.* TO 'wso2carbon'@'localhost';
```

- Verify if the databases and the user was created properly and the authorization was provided using the below commands.
 
to list all the databases currently present. It should contain “wso2am_db” and “wso2shared_db”

```bash
show databases;
```

to find out the existing users. It should contain the user “wsocarbon”.

```bash
select user from user;  
``` 

to verify if “wso2carbon” has access on “wso2am_db” and “wso2shared_db”. The below queries should return “wso2carbon” in the result.

```bash
select user FROM mysql.db WHERE db = 'wso2am_db';
select user FROM mysql.db WHERE db = 'wso2shared_db';
```

## Setting Up the Drivers: 

- Download the MySQL Java connector [JAR](https://dev.mysql.com/downloads/connector/j/) file, and extract it.

- Copy it to the <API-M_HOME>/repository/components/lib/ directory. 


```bash
$ wget  https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.25.tar.gz

[root@ip-172-31-16-21 mysql-connector-java-8.0.25]# cp -RP mysql-connector-java-8.0.25.jar /opt/apm/wso2/repository/components/lib/

```

## Executing DB Scripts To Create Tables on MySQL Database:

-  To create tables in the registry and user manager database (WSO2SHARED_DB), execute the below commands.
```sql
use wso2shared_db;
source <API-M_HOME>/dbscripts/mysql.sql;

source /opt/apm/wso2/dbscripts/mysql.sql;
```

- To create tables in the apim database (WSO2AM_DB), execute the below commands
```sql
use wso2am_db;
source <API-M_HOME>/dbscripts/apimgt/mysql.sql;
```

-  Verify if the required tables got created in both the databases using the below commands.

```sql
use WSO2SHARED_DB;           
show tables;
```

```sql
MariaDB [WSO2SHARED_DB]> show tables; 
+-------------------------+
| Tables_in_WSO2SHARED_DB |
+-------------------------+
| REG_ASSOCIATION         |
| REG_CLUSTER_LOCK        |
| REG_COMMENT             |
..........................
39 rows in set (0.00 sec)
```

```sql 
use WSO2AM_DB;
show tables;
```
```sql
MariaDB [WSO2AM_DB]> show tables;
+--------------------------------+
| Tables_in_WSO2AM_DB            |
+--------------------------------+
| AM_ALERT_EMAILLIST             |
| AM_ALERT_EMAILLIST_DETAILS     |
| AM_ALERT_TYPES                 |
| AM_ALERT_TYPES_VALUES          |
| AM_API_CATEGORIES              |
........
121 rows in set (0.00 sec)
```


## Creating the datasource Connection to MySQL:

-  Open the <API-M_HOME>/repository/conf/deployment.toml configuration file and locate the [database.shared_db] and [database.apim_db] configuration elements.

-  You simply have to update the URL pointing to your MySQL database, the username, and password required to access the database and the MySQL driver details as shown below.

```yml
[database.apim_db]
type = "mysql"
driver="com.mysql.cj.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/wso2am_db?useSSL=false"
username = "wso2carbon"
password = "wso2carbon"


[database.shared_db]
type = "mysql"
driver="com.mysql.cj.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/wso2shared_db?useSSL=false"
username = "wso2carbon"
password = "wso2carbon"
```

NOTE: (If you are using MySQL version - 8.0.x, you should add the driver name in the configuration as: driver="com.mysql.cj.jdbc.Driver". As, I am using 8.0.x, so, I have added that line).

## Restart the WSO2 Server


## APIM analytics 

Create tables 

create database analytics_db; 
grant all on analytics_db.* TO 'wso2carbon'@'localhost';
use analytics_db; 
source /opt/apm/wso2am-analytics-3.2.0/wso2/worker/dbscripts/apim-analytics/mysql.sql ; 


create database metrics_db;
grant all on metrics_db.* TO 'wso2carbon'@'localhost';
use metrics_db; 
source /opt/apm/wso2am-analytics-3.2.0/wso2/worker/dbscripts/metrics/mysql.sql ;



KB5003778
KB5003646
    - name: APIM_ANALYTICS_DB
      description: "The datasource used for APIM statistics aggregated data."
      jndiConfig:
        name: jdbc/ANALYTICS_DB
      definition:
        type: RDBMS
        configuration:
          jdbcUrl: "jdbc:mysql://localhost:3306/analytics_db?useSSL=false"
          username: wso2carbon
          password: wso2carbon
          driverClassName: com.mysql.jdbc.Driver
          maxPoolSize: 50
          idleTimeout: 600
          connectionTestQuery: SELECT 1
          validationTimeout: 300
          isAutoCommit: false

    # carbon metrics data source
    - name: WSO2_METRICS_DB
      description: The datasource used for dashboard feature
      jndiConfig:
        name: jdbc/WSO2MetricsDB
      definition:
        type: RDBMS
        configuration:
          jdbcUrl: 'jdbc:mysql://localhost:3306/metrics_db?useSSL=false'
          username: wso2carbon
          password: wso2carbon
          driverClassName: com.mysql.jdbc.Driver
          maxPoolSize: 30
          idleTimeout: 60000
          connectionTestQuery: SELECT 1
          validationTimeout: 30000
          isAutoCommit: false

## Carga geolocation

    - name: GEO_LOCATION_DATA
      description: "The data source used for geo location database"
      jndiConfig:
        name: jdbc/GEO_LOCATION_DATA
      definition:
        type: RDBMS
        configuration:
          jdbcUrl: 'jdbc:mysql://localhost:3306/geolocation_db?useSSL=false'
          username: wso2carbon
          password: wso2carbon
          driverClassName: com.mysql.jdbc.Driver
          maxPoolSize: 50
          idleTimeout: 60000
          validationTimeout: 30000
          isAutoCommit: false

create database GEO_LOCATION_DATA; 
grant all on GEO_LOCATION_DATA.* TO 'wso2carbon'@'localhost';
use GEO_LOCATION_DATA; 

source /opt/apm/wso2am-analytics-3.2.0/mysql.sql ;

load data local infile '/opt/apm/geolocation/final.csv' into table BLOCKS
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
(network_cidr, network, broadcast, geoname_id, registered_country_geoname_id, represented_country_geoname_id, is_anonymous_proxy, is_satellite_provider, postal_code, latitude, longitude, network_blocks);

source /opt/apm/wso2am-analytics-3.2.0/geo.sql ;

load data local infile '/opt/apm/geolocation/GeoLite2-City-CSV_20210622/GeoLite2-City-Locations-pt-BR.csv' into table LOCATION
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
(geoname_id, locale_code, continent_code, continent_name, country_iso_code, country_name, subdivision_1_iso_code, subdivision_1_name, subdivision_2_iso_code, subdivision_2_name, city_name, metro_code, time_zone);



type = "mysql"
driver="com.mysql.cj.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/wso2am_db?useSSL=false"
username = "wso2carbon"
password = "wso2carbon"

ALTER USER 'root'@'%' IDENTIFIED BY 'pokavergonha321';

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('pokavergonha321');


https://192.168.0.15:9643/policies
https://192.168.0.15:9643/business-rules






https://192.168.0.15:9643/analytics-dashboard



vim /usr/lib/systemd/system/wso2.service

[Unit]
Description=WSO2 APIM 3.2.0 
After=syslog.target network.target

[Service]
User=wso2user
Group=wso2user
TimeoutStartSec=600
TimeoutStopSec=600
Type=forking
Environment=JAVA_HOME=/usr/lib/jvm/jre/
ExecStart=/opt/apm/wso2/bin/worker.sh --start
ExecStop=/opt/apm/wso2/bin/worker.sh --stop
PIDFile/opt/apm/wso2/runtime.pid

[Install]
WantedBy=multi-user.target

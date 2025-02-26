- [Notes](#notes)
  - [reset mysql password](#reset-mysql-password)
- [Articles](#articles)
- [Test data](#test-data)
- [5 MySQL Server Administration](#5-mysql-server-administration)
- [10 Optimization](#10-optimization)
- [13 Data Types](#13-data-types)
- [12 The JSON Data Type](#12-the-json-data-type)
- [14 Functions and Operators](#14-functions-and-operators)
  - [14.4 Operators](#144-operators)
  - [14.5 Flow Control Functions](#145-flow-control-functions)
- [17 The InnoDB Storage Engine](#17-the-innodb-storage-engine)
  - [17.1 Introduction to InnoDB](#171-introduction-to-innodb)
    - [d-Key Advantages of InnoDB](#d-key-advantages-of-innodb)
  - [d-17.2 InnoDB and the ACID Model](#d-172-innodb-and-the-acid-model)
  - [d-17.7.2.1 Transaction Isolation Levels](#d-17721-transaction-isolation-levels)
  - [17.7.2.3 Consistent Nonlocking Reads](#17723-consistent-nonlocking-reads)
  - [d-17.3 InnoDB Multi-Versioning](#d-173-innodb-multi-versioning)
- [19 Replication](#19-replication)
  - [Table \& db filtering](#table--db-filtering)
  - [17.1.1 Binary Log File Position Based Replication Configuration Overview](#1711-binary-log-file-position-based-replication-configuration-overview)
    - [Setting the Replication Source Configuration](#setting-the-replication-source-configuration)
    - [Creating a User for Replication](#creating-a-user-for-replication)
    - [doc-Obtaining the Replication Source Binary Log Coordinates](#doc-obtaining-the-replication-source-binary-log-coordinates)
    - [doc-Choosing a Method for Data Snapshots](#doc-choosing-a-method-for-data-snapshots)
      - [Creating a Data Snapshot Using mysqldump](#creating-a-data-snapshot-using-mysqldump)
    - [doc-Setting the Source Configuration on the Replica](#doc-setting-the-source-configuration-on-the-replica)
  - [17.1.3 Replication with Global Transaction Identifiers](#1713-replication-with-global-transaction-identifiers)
    - [GTID Format and Storage](#gtid-format-and-storage)
    - [doc-Setting Up Replication Using GTIDs](#doc-setting-up-replication-using-gtids)
- [25 Stored Objects](#25-stored-objects)
  - [25.2 Using Stored Routines](#252-using-stored-routines)
  - [25.3 Using Triggers](#253-using-triggers)
- [MySQL Glossary](#mysql-glossary)
    - [consistent read](#consistent-read)
    - [MVCC](#mvcc)
- [Install](#install)
  - [Windows 10 (8.0.35)](#windows-10-8035)
    - [my.ini](#myini)
    - [Initialization](#initialization)
    - [Remote connection](#remote-connection)
  - [Ubuntu Server 22.04 (8.0.35)](#ubuntu-server-2204-8035)


# Notes

## reset mysql password

0. stop mysql service
1. perform command `mysqld --console --skip-grant-tables --shared-memory`, keep it opened
2. login again by `mysql -uroot -p`, no pwd.
3. set pwd to null, `UPDATE mysql.user SET authentication_string='' WHERE user='root';`
4. end up the `skip-grant-tables` cmd window
5. start mysql service and login `mysql -uroot -p`
6. set new pwd, `use mysql ;ALTER user root@'localhost' identified by 'root';`


# Articles

https://blog.logrocket.com/5-ways-rapidly-improve-mysql-database-performance/#indexes-partitions

# Test data

https://dev.mysql.com/doc/index-other.html


# 5 MySQL Server Administration

# 10 Optimization



# 13 Data Types

<span style='font-size: 15px;'>**Numeric Data Types**</span>  
- Numeric Data Types  
  - Integer Types (Exact Value) 
    - INTEGER
    - INT
    - SMALLINT
    - TINYINT
    - MEDIUMINT
    - BIGINT  

  - Fixed-Point Types (Exact Value) 
    - DECIMAL
    - NUMERIC  

  - Floating-Point Types (Approximate Value) 
    - FLOAT
    - DOUBLE  

  - Bit-Value Type 
    - BIT  

- Date and Time Data Types  
  - DATE
  - DATETIME
  - TIMESTAMP Types  
  - TIME Type  
  - YEAR Type  

- String Data Types  
  - CHAR and VARCHAR Types  
  - BINARY and VARBINARY Types  
  - BLOB and TEXT Types  
  - ENUM Type  
  - SET Type  

- The JSON Data Type


# 12 The JSON Data Type

# 14 Functions and Operators

## 14.4 Operators

## 14.5 Flow Control Functions

# 17 The InnoDB Storage Engine

## 17.1 Introduction to InnoDB

### d-Key Advantages of InnoDB

## d-17.2 InnoDB and the ACID Model

• A: atomicity.
• C: consistency.
• I:: isolation.
• D: durability.

## d-17.7.2.1 Transaction Isolation Levels

key words: `Phantom read`  

<span style='font-size: 15px;'>**REPEATABLE READ**</span>  
Issues:  
Phantom Reads: A query may return additional rows if another transaction inserts data matching the query criteria.

<span style='font-size: 15px;'>**READ COMMITTED**</span>  
Issues:  
Non-repeatable Reads: A row read earlier in a transaction may change if another transaction modifies and commits it.  
Phantom Reads may still occur.

<span style='font-size: 15px;'>**READ UNCOMMITTED**</span>  
Issues:  
Dirty Reads: Reading uncommitted changes that may later be rolled back.  
Non-repeatable Reads: Same query can return different results within the same transaction.  
Phantom Reads: New rows may appear in subsequent reads.

<span style='font-size: 15px;'>**SERIALIZABLE**</span>  
Issues:  
No concurrency; all transactions must wait for others to finish.  
Can cause performance bottlenecks in high-traffic environments.

## 17.7.2.3 Consistent Nonlocking Reads

A consistent read means that InnoDB uses multi-versioning to present to a query a snapshot of the
database at a point in time.


## d-17.3 InnoDB Multi-Versioning

InnoDB is a multi-version storage engine. It keeps information about `old versions of changed rows` to
support transactional features such as **concurrency** and **rollback**.

# 19 Replication 

[tutorial](https://blog.csdn.net/liuhenghui5201/article/details/113567248)

Replication enables data `from one` MySQL database server (known as a source) to be copied `to one or more` MySQL database servers (known as replicas). 

## Table & db filtering

see also *17.1.6.1 Replication and Binary Logging Option and Variable Reference*

```ini
#==========主从配置master====================
#binlog 文件名
log-bin=mysql-bin
binlog_format=ROW
server_id=1
#设置需要同步的数据库名
binlog-do-db=course_db
binlog-do-db=course_db_1
binlog-do-db=course_db_2
binlog-do-db=user_db
#屏蔽数据库同步
binlog-ignore-db=mysql
binlog-ignore-db=performance_schema
binlog-ignore-db=information_schema
```


```ini
#==========主从配置slave====================
#binlog 文件名
log-bin=mysql-bin
binlog_format=ROW
server_id=2
#设置需要同步的数据库
replicate_wild_do_table=course_db.%
replicate_wild_do_table=course_db_1.%
replicate_wild_do_table=course_db_2.%
replicate_wild_do_table=user_db.%
#设置忽略同步的数据库
replicate_wild_ignore_table=mysql.%
replicate_wild_ignore_table=performance_schema.%
replicate_wild_ignore_table=information_schema.%
```

## 17.1.1 Binary Log File Position Based Replication Configuration Overview

where the MySQL instance operating as the source (where the database changes take place) writes updates and changes as **“events”** to the binary log.

Replicas are configured to read the binary log from the source and **to execute** the events in the binary log on the replica's local database.

### Setting the Replication Source Configuration

```ini
[mysqld]
server-id=21
```

setting system variable `SET GLOBAL server_id = 2;`

### Creating a User for Replication

```sql
CREATE USER 'repl'@'%' IDENTIFIED BY 'pwd';

CREATE USER 'repl'@'%' IDENTIFIED BY '123456';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
```

### doc-Obtaining the Replication Source Binary Log Coordinates

### doc-Choosing a Method for Data Snapshots

#### Creating a Data Snapshot Using mysqldump

saved at `mysql\bin`

### doc-Setting the Source Configuration on the Replica

Querying staes by `SHOW SLAVE STATUS\G` on replicas:
```
        Slave_IO_State: Waiting for source to send event
            Master_Host: 127.0.0.1
            Master_User: repl
            Master_Port: 3308
        Connect_Retry: 60
        Master_Log_File: binlog.000003
    Read_Master_Log_Pos: 1317
        Relay_Log_File: DESKTOP-RUEA6K6-relay-bin.000003
        Relay_Log_Pos: 616
Relay_Master_Log_File: binlog.000003
        Slave_IO_Running: Yes
    Slave_SQL_Running: Yes
```


**After** configure this.  
If the both states `Slave_IO_Running` and `Slave_SQL_Running` of replicas are `No`,  
try to restart replicas.


## 17.1.3 Replication with Global Transaction Identifiers

### GTID Format and Storage

A global transaction identifier (GTID) is a unique identifier created and associated with each transaction
committed on the server of origin (the source).


### doc-Setting Up Replication Using GTIDs

1. Settings at `my.ini` 
2. Create relationship between source and replicas 
3. Check it out by `SHOW SLAVE STATUS;`



# 25 Stored Objects

<span style='font-size: 15px;'>**Stored procedure**</span>  
A procedure does not have a return value but can modify its parameters for later
inspection by the caller. It can also generate result sets to be returned to the client program.

<span style='font-size: 15px;'>**Stored function**</span>  
used much like a built-in function.  
You invoke it in an expression and it returns a value during expression evaluation.

<span style='font-size: 15px;'>**Trigger**</span>  
A trigger is activated when a particular event occurs for the table, such as an `insert` or `update`.

<span style='font-size: 15px;'>**Event**</span>  
An object created with CREATE EVENT and invoked by the server according to schedule.

<span style='font-size: 15px;'>**View**</span>  
when referenced produces a result set. A view acts as a virtual table.



## 25.2 Using Stored Routines

MySQL supports stored routines (procedures and functions). 
A stored routine is a set of SQL statements that can be stored in the server.  
Once this has been done, clients don't need to keep reissuing the individual statements but can refer to the stored routine instead.

## 25.3 Using Triggers

A trigger is a named database object that is associated with a table, and that activates when a
particular event occurs for the table. 


# MySQL Glossary

### consistent read

A read operation that uses snapshot information to present query results based on a point in time,
regardless of changes performed by other transactions running at the same time.  

If queried data has been changed by another transaction, the original data is reconstructed based on the contents of the *undo log*.

### MVCC

Acronym for “multiversion concurrency control”. This technique lets InnoDB transactions **with certain
isolation levels** perform consistent read operations; that is, to query rows that are being updated by other transactions, and see the values from before those updates occurred. 

# Install

## Windows 10 (8.0.35)

[tutorial](https://blog.csdn.net/weixin_55629817/article/details/134381183)

[download zip](https://downloads.mysql.com/archives/community/)

### my.ini
```ini
[mysqld]
port=3306
basedir=F:\Program Files\mysql-8.0.35-winx64-3306\
datadir=F:\Program Files\mysql-8.0.35-winx64-3306\data
max_connections=200
max_connect_errors=10
character-set-server=utf8mb4
default-storage-engine=INNODB
default_authentication_plugin=mysql_native_password

server-id=9
gtid_mode=ON
enforce-gtid-consistency=ON

binlog-ignore-db=mysql
binlog-ignore-db=performance_schema
binlog-ignore-db=information_schema

[mysql]
default-character-set=utf8mb4

[client]
port=3306
default-character-set=utf8mb4
```

### Initialization

`cd mysql/bin`

init `mysqld --initialize --console`

install service `mysqld --install mysql`

start service `net start mysql`

connect to `mysql -uroot -p`

set new pwd `ALTER USER 'root'@'localhost' IDENTIFIED BY '新的密码';`

### Remote connection

my.ini
```ini
[mysqld]
bind-address = 0.0.0.0
```

OR

`update user set host = ’%’ where user = ’root’;`


## Ubuntu Server 22.04 (8.0.35)

[tutorial](https://blog.csdn.net/qq_42108074/article/details/133000359)

[mysql-server_8.0.35-1ubuntu22.04_amd64.deb-bundle.tar](https://downloads.mysql.com/archives/community/)


`tar -xf mysql-server_8.0.35-1ubuntu22.04_amd64.deb-bundle.tar`

install commands, to be modified.
```shell
sudo dpkg -i /mysql8/mysql-community-client-plugins_8.0.31-1ubuntu20.04_amd64.deb
sudo dpkg -i  /mysql8/mysql-community-client-core_8.0.31-1ubuntu20.04_amd64.deb
sudo dpkg -i  /mysql8/mysql-common_8.0.31-1ubuntu20.04_amd64.deb
sudo dpkg -i  /mysql8/mysql-community-client_8.0.31-1ubuntu20.04_amd64.deb
sudo dpkg -i /mysql8/libmysqlclient21_8.0.31-1ubuntu20.04_amd64.deb
sudo dpkg -i /mysql8/libmysqlclient-dev_8.0.31-1ubuntu20.04_amd64.deb
sudo apt install -y libmecab2
sudo dpkg -i /mysql8/mysql-community-server-core_8.0.31-1ubuntu20.04_amd64.deb
sudo dpkg -i /mysql8/mysql-client_8.0.31-1ubuntu20.04_amd64.deb
sudo dpkg -i /mysql8/mysql-community-server_8.0.31-1ubuntu20.04_amd64.deb
# 需要输入密码

```

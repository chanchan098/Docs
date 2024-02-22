# mid-3-sarhding-sphere.md

# Examples

<https://github1s.com/yudiandemingzi/spring-boot-sharding-sphere>  
<https://github.com/yudiandemingzi/spring-boot-sharding-sphere>

# Overview

<https://shardingsphere.apache.org/document/current/en/overview/>

Apache ShardingSphere is an ecosystem to transform any database **into a distributed database system**,  
and enhance it with **sharding, elastic scaling, encryption features & more**.

# Features-Sharding

<https://shardingsphere.apache.org/document/current/en/features/sharding/>

## Background

The traditional solution that stores all the data in **one concentrated node** has hardly satisfied the requirement  
of massive data scenario in three aspects, **performance, availability and operation cost**.  

- **In performance**  
  the relational database mostly uses **B+ tree index**. When the data amount exceeds the threshold, deeper index will increase **the disk IO access number**, and thereby, weaken the performance of query. In the same time, high concurrency requests also make the centralized database to be the greatest limitation of the system.

- **In availability**  
  **capacity** can be expanded at a relatively low cost and any extent with **stateless service**, which can make all the pressure, at last, **fall on the database**. But the single data node or simple primary-replica structure has been harder and harder to take these pressures. Therefore, database availability has become the key to the whole system.

- **From the aspect of operation costs**  
  when the data in a database instance has reached above the threshold, DBA’s operation pressure will also increase. The time cost of **data backup and data recovery** will be more uncontrollable with increasing amount of data. Generally, it is a relatively reasonable range for the data in single database case to be within 1TB.

---

Sharding refers to splitting the data in one database and storing them in **multiple tables and databases**  
according to some certain standard, so that the performance and availability can be improved.

Table sharding, though cannot ease the database pressure, can provide possibilities to transfer distributed transactions to local transactions,

Splitting data through database sharding and table sharding is an effective method to deal with **high TPS** and **mass amount data system**, because it can keep the data amount *lower than the threshold* and evacuate the *traffic*. Sharding method can be divided into **vertical sharding and horizontal sharding.**


### Vertical Sharding

the core concept of which is to specialize databases for **different uses**.

<details>
<summary>image</summary>

![alt](https://shardingsphere.apache.org/document/current/img/sharding/vertical_sharding.png)

</details>

Vertical sharding requires to adjust **the architecture and design** from time to time.  


Generally speaking, it is not soon enough to deal with fast changing needs from Internet business and not able to really solve the single-node problem.  
it can ease problems brought by **the high data amount and concurrency amount**, but cannot solve them completely.   
After vertical sharding, if the data amount in the table still exceeds the single node threshold, it should be further processed by horizontal sharding.  

### Horizontal Sharding

Horizontal sharding is also called transverse sharding.  

Horizontal sharding categorizes data to multiple databases or tables according to *some certain rules* through  
**certain fields**, with each sharding containing only *part of the data*.  

For example, according to primary key sharding, even primary keys are put into the 0 database (or table) and odd primary keys are put into the 1 database (or table), which is illustrated as the following diagram.


<details>
<summary>image</summary>

![alt](https://shardingsphere.apache.org/document/current/img/sharding/horizontal_sharding.png)

</details>

Theoretically, horizontal sharding has overcome the limitation of data processing volume in single machine and **can be extended relatively freely**, so it can be taken as a standard solution to database sharding and table sharding.

## Challenges

Another challenge is that SQL that works correctly in one single-node database **does not necessarily** work correctly in a sharded database.  
For example, table splitting results in table name changes, or incorrect handling of operations such as paging, sorting, and aggregate grouping.

Cross-library transactions are also tricky for a distributed database cluster.


# Features-Sharding-Core concept

## Table

### Logic Table

The logical name of the horizontally sharded database (table) of **the same structure** is the logical identifier of the table in SQL. Example: Order data is split into 10 tables according to the primary key endings, are `t_order_0` to `t_order_9`, and their **logical table names are `t_order`**.

### Actual Table

Physical tables that exist in the horizontally sharded databases. Those are, `t_order_0` to `t_order_9` in the previous example.

### Binding Table

## Data Nodes

The smallest unit of the data shard, consists of the data source name and the real table. Example: `ds_0.t_order_0`.

### Uniform Distribution

refers to situations where the data table exhibits a uniform distribution within each data source. For example:

```
db0
  ├── t_order0
  └── t_order1
db1
  ├── t_order0
  └── t_order1
```

The configuration of data nodes:

```
db0.t_order0, db0.t_order1, db1.t_order0, db1.t_order1

```

### Customized Distribution

Data table exhibiting a patterned distribution. For example:

```
db0
  ├── t_order0
  └── t_order1
db1
  ├── t_order2
  ├── t_order3
  └── t_order4

```

configuration of data nodes:

```
db0.t_order0, db0.t_order1, db1.t_order2, db1.t_order3, db1.t_order4
```

## Sharding

### Sharding key

Example: If the order primary key in the order table is sharded by **modulo**, the order primary key is a sharded field. 

In addition to the support for single-sharding fields, Apache ShardingSphere also supports sharding based on **multiple fields**.

### Automatic Sharding Algorithm

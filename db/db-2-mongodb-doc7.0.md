# db-2-mongodb.md

# Installation

## Setp by setp

## Accessible for remote machine

### Linux

`sudo vi /etc/mongod.conf`

### Windows

*C:\Program Files\MongoDB\Server\7.0\bin\mongod.cfg*

set `bindIp: 0.0.0.0`

# Introduction 

<https://www.mongodb.com/docs/manual/introduction/>

## Document Database

A record in MongoDB is **a document**, which is a data structure composed of `field and value pairs`.  

MongoDB documents are similar to JSON objects.  
The values of fields may include other documents, arrays, and arrays of documents.

![alt](https://www.mongodb.com/docs/manual/images/crud-annotated-document.bakedsvg.svg)

# Databases and Collections-Introduction

## Overview

MongoDB stores data records as *documents* (specifically BSON documents) which are gathered together in `collections`.  
- [x] A database stores one or more collections of documents.

## Databases

In MongoDB, databases hold one or more collections of documents. 

## Collections

MongoDB stores documents in collections. Collections are analogous to `tables` in relational databases.
![alt](https://www.mongodb.com/docs/manual/images/crud-annotated-collection.bakedsvg.svg)

# Views-Databases and Collections -Introduction

### Views

A MongoDB view is **a read-only queryable object** whose contents are defined  
by *an aggregation pipeline* on other collections or views.

MongoDB **does not** persist the view contents to disk.

> Note: used for template info.

### On-Demand Materialized Views

An on-demand materialized view is a pre-computed aggregation pipeline result  
that is **stored on and read from disk**. 

The results of a `$merge` or `$out` stage.

### Capped Collections

Work in a way similar to circular buffers

### Clustered Collections

Collections created with a clustered index are called clustered collections.

# Documents(a document as a row) -Introduction

## Document Structure

MongoDB documents are composed of field-and-value pairs and have the following structure:
```javascript
{
   field1: value1,
   field2: value2,
   field3: value3,
   ...
   fieldN: valueN
}
```


## Dot Notation

To access the elements of an array and to access the fields of an embedded document.  

### Array
`"<array>.<index>"`

```javascript
{
   ...
   contribs: [ "Turing machine", "Turing test", "Turingery" ],
   ...
}
```

To specify the third element in the contribs array, use the dot notation `"contribs.2"`.

### Embedded Documents

concatenate the embedded document name with the dot (.) and the field name, and enclose in quotes  

`"<embedded document>.<field>"`


```javascript
{
   ...
   name: { first: "Alan", last: "Turing" },
   contact: { phone: { type: "cell", number: "111-222-3333" } },
   ...
}
```


`"contact.phone.number"`

## Document Limitations

### Document Size Limit

The maximum BSON document size is **16 megabytes**.
  - cannot use excessive amount of RAM. 
  - or, during transmission, excessive amount of bandwidth.

To store documents larger than the maximum size, MongoDB provides the `GridFS API`. 

# MongoDB Query API -Introduction

The MongoDB Query API is the mechanism that you use **to interact with your data**.

Two ways to query data
- CRUD Operations
- Aggregation pipelines

# 🚴‍♂️ BSON Types -Introduction

## Object Id

<https://www.mongodb.com/docs/manual/reference/bson-types/#objectid>

ObjectIds are small, likely unique, fast to generate, and ordered. 

ObjectId values are 12 bytes in length

- A 4-byte timestamp, representing the ObjectId's creation, measured in seconds since the Unix epoch.

- A 5-byte random value generated once per process. This random value is unique to the machine and process.

- A 3-byte incrementing counter, initialized to a random value.

# MongoDB CRUD Operations

<https://www.mongodb.com/docs/manual/crud/>

# Insert Documents - MongoDB CRUD Operations

# Query Documents - MongoDB CRUD Operations

# Aggregation Operations

<https://www.mongodb.com/docs/manual/aggregation/>

Aggregation operations <u>process multiple documents and return computed results.</u>

use to:
- Group values from multiple documents together.
- Perform operations on the grouped data to return a single result.
- Analyze data changes over time.


## Aggregation Pipelines

An aggregation pipeline consists of one or more stages that process documents:

- Each stage performs an operation on the input documents.  
  For example, a stage can filter documents, group documents, and calculate values.

- The documents that are output from a stage are passed to the next stage.
  
- aggregation pipeline can return results for `groups of documents`.  
  For example, return the total, average, maximum, and minimum values.

### Aggregation Pipeline Example

The following aggregation pipeline example contains two stages and returns the total order quantity of medium size pizzas grouped by pizza name:

```javascript
db.orders.aggregate( [

   // Stage 1: Filter pizza order documents by pizza size
   {
      $match: { size: "medium" }
   },

   // Stage 2: Group remaining documents by pizza name and calculate total quantity
   {
      $group: { _id: "$name", totalQuantity: { $sum: "$quantity" } }
   }

] )
```

The `$match` stage:

- Filters the pizza order documents to pizzas with a size of medium.

- Passes the remaining documents to the `$group` stage.

The `$group` stage:

- Groups the remaining documents by pizza name.

- Uses `$sum` to calculate the total order quantity for each pizza name. The total is stored in the totalQuantity field returned by the aggregation pipeline.



### Join
```javascript
db.orders.aggregate([
  {
    $lookup:
      {
        from: "customers",
        localField: "customer_id",
        foreignField: "_id",
        as: "customer_info"
      }
  },
  // 其他pipeline阶段...
]);
```

## Single Purpose Aggregation Methods 

The single purpose aggregation methods aggregate documents from a single collection. The methods are simple but lack the capabilities of an aggregation pipeline.

# Transactions

For situations that require atomicity of reads and writes to multiple documents (in a single or multiple collections),  
MongoDB supports *distributed transactions*.  
With distributed transactions, transactions can be used <mark>across multiple operations, collections, databases, documents, and shards</mark>.

## Transactions API(an example)

## Transactions and Atomicity

MongoDB supports distributed transactions, including transactions on `replica sets` and `sharded clusters`.

Distributed transactions are atomic:
- Transactions either apply all data changes or roll back the changes.
- If a transaction commits, all data changes made in the transaction are saved and are visible outside of the transaction.
- When a transaction aborts, all data changes made in the transaction are discarded without ever becoming visible.

## 🚴‍♂️ Transactions and Operations

Distributed transactions can be used <u>across multiple operations, collections, databases, documents, and shards</u>.

You can create collections and indexes in transactions. 

## Transactions and Sessions

## 🚴‍♂️ Read Concern/Write Concern/Read Preference

### Transactions and Read Preference

Operations in a transaction use `the transaction-level read preference`.

### Transactions and Read Concern

Operations in a transaction use `the transaction-level read concern`.

### Transactions and Write Concern

Transactions use the transaction-level write concern to commit the write operations.

# Sharding

Sharding is a method for distributing data across multiple machines.  
MongoDB uses sharding to support deployments with very large data sets and high throughput operations.

## Sharded Cluster


# Installation
## Setp by setp
## Accessible for remote machine

### Linux

sudo vi /etc/mongod.conf


### Windows

C:\Program Files\MongoDB\Server\7.0\bin\mongod.cfg

set `bindIp: 0.0.0.0`

# Introduction 

## Databases and Collections(a collection as a table)

Collections are analogous to tables in relational databases.

### Views

A MongoDB view is **a read-only queryable object** whose contents are defined  
by *an aggregation pipeline* on other collections or views.

MongoDB **does not** persist the view contents to disk.

**used for template info.**

### On-Demand Materialized Views

An on-demand materialized view is a pre-computed aggregation pipeline result  
that is **stored on and read from disk**. 

The results of a `$merge` or `$out` stage.

### Capped Collections

Work in a way similar to circular buffers

### Clustered Collections

Collections created with a clustered index are called clustered collections.

## Documents(a document as a row)

### Document Structure

### Dot Notation

To access the elements of an array and to access the fields of an embedded document.  

#### Array
`"<array>.<index>"`

```javascript
{
   ...
   contribs: [ "Turing machine", "Turing test", "Turingery" ],
   ...
}
```

To specify the third element in the contribs array, use the dot notation `"contribs.2"`.

#### Embedded Documents

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

### Document Limitations

#### Document Size Limit

The maximum BSON document size is **16 megabytes**.
  - cannot use excessive amount of RAM. 
  - or, during transmission, excessive amount of bandwidth.

To store documents larger than the maximum size, MongoDB provides the `GridFS API`. 

## MongoDB Query API

The MongoDB Query API is the mechanism that you use **to interact with your data**.

Two ways to query data
- CRUD Operations
- Aggregation pipelines

## BSON Types

# MongoDB CRUD Operations

# Aggregation Operations

use to:
- Group values from multiple documents together.
- Perform operations on the grouped data to return a single result.
- Analyze data changes over time.
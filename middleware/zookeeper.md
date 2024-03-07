# Welcome

<https://zookeeper.apache.org/doc/r3.9.1/index.html>

ZooKeeper is a high-performance **coordination service** for distributed applications.  
It exposes common services - such as naming, configuration management, synchronization, and group services

# Overview

<https://zookeeper.apache.org/doc/r3.9.1/zookeeperOver.html>

## ZooKeeper: A Distributed Coordination Service for Distributed Applications

ZooKeeper is a distributed, open-source coordination service for distributed applications.  

It is designed to be easy to program to, and uses a data model styled after the familiar  
directory tree structure of file systems.

## Design Goals

- **ZooKeeper is simple.**  
  ZooKeeper allows distributed processes to coordinate with each other through a shared hierarchical namespace which is organized similarly to a standard file system.

- **ZooKeeper is replicated.**  
  Like the distributed processes it coordinates, ZooKeeper itself is intended to be replicated over **a set of hosts** called an ensemble.  
  ![alt](https://zookeeper.apache.org/doc/r3.9.1/images/zkservice.jpg)  
  The client maintains a TCP connection **through which** it sends requests, gets responses, gets watch events,  
  and sends heart beats. If the TCP connection to the server breaks, the client will connect to a different  
  server.

- **ZooKeeper is ordered.**  
  ZooKeeper stamps each update with a number that reflects the order of all ZooKeeper transactions. Subsequent  
  operations can use the order to implement higher-level abstractions, such as **synchronization primitives**.

- **ZooKeeper is fast.**  
  It is especially fast in "read-dominant" workloads. ZooKeeper applications run on thousands of machines, and  
  it performs best where **reads are more common than writes**, at ratios of around 10:1.

## Data model and the hierarchical namespace

The namespace provided by ZooKeeper is much like that of **a standard file system**.  
A name is a sequence of path elements separated by a slash (/).  
Every node in ZooKeeper's namespace **is identified by a path**.  

ZooKeeper's Hierarchical Namespace  
![alt](https://zookeeper.apache.org/doc/r3.9.1/images/zknamespace.jpg)

## Nodes and ephemeral nodes

We use the term *znode* to make it clear that we are talking about ZooKeeper data nodes.  

- version number  
  Znodes maintain a stat structure that includes **version numbers** for data changes, ACL changes, and timestamps,  
  to allow cache validations and coordinated updates. Each time a znode's data changes, the version number  increases.  
  For instance, whenever a client retrieves data it also receives the version of the data.

- read and write data  
  The data stored at each znode in a namespace is read and written atomically.  
  Reads get all the data bytes associated with a znode and a write replaces all the data.  
  Each node has an Access Control List (ACL) that restricts who can do what.

- ephemeral nodes  
  ZooKeeper also has the notion of **ephemeral nodes**. These znodes exists as long as the session  
  that created the znode is active. When the session ends the znode is deleted.


## Conditional updates and watches

Clients can set **a watch** on a znode. A watch will be triggered and removed when *the znode changes*.  

- saying network broken  
  If the connection between the client and one of the ZooKeeper servers is broken, the client will receive **a local notification**.

**New in 3.6.0:** Clients can also set permanent, recursive watches on a znode that are not removed when triggered and that trigger for changes on the registered znode as well as **any children znodes** recursively.

## Guarantees
- Sequential Consistency - Updates from a client will be applied in the order that they were sent.
- Atomicity - Updates either succeed or fail. No partial results.
- Single System Image - A client will see the same view of the service regardless of the server that it connects to. i.e., a client will never see an older view of the system even if the client fails over to a different server with the same session.
- Reliability - Once an update has been applied, it will persist from that time forward until a client overwrites the update.
- Timeliness - The clients view of the system is guaranteed to be up-to-date within a certain time bound.

## Simple API

One of the design goals of ZooKeeper is providing a very simple programming interface. As a result, it supports only these operations:

- create : creates a node at a location in the tree
- delete : deletes a node
- exists : tests if a node exists at a location
- get data : reads the data from a node
- set data : writes data to a node
- get children : retrieves a list of children of a node
- sync : waits for data to be propagated

# to be continued 
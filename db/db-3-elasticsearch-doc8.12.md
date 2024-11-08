- [- 8.15](#--815)
- [--Elasticsearch basics](#--elasticsearch-basics)
- [Indices, documents, and fields](#indices-documents-and-fields)
  - [Documents and fields](#documents-and-fields)
  - [Mappings and data types](#mappings-and-data-types)
- [Get ready for production](#get-ready-for-production)
  - [Use multiple nodes and shards](#use-multiple-nodes-and-shards)
- [--Configuring Elasticsearch](#--configuring-elasticsearch)
- [Shard allocation, relocation, and recovery](#shard-allocation-relocation-and-recovery)
- [--Mapping](#--mapping)
  - [Dynamic mapping](#dynamic-mapping)
  - [Explicit mapping](#explicit-mapping)
- [--Index modules](#--index-modules)
- [-----](#-----)
- [Indices, documents, and fields](#indices-documents-and-fields-1)
- [What is the ES](#what-is-the-es)
- [Inverted index](#inverted-index)
- [Information out: search and analyze](#information-out-search-and-analyze)
- [testing purposes](#testing-purposes)
- [Searching your data](#searching-your-data)
  - [Quering types](#quering-types)
- [Analyzing your data](#analyzing-your-data)
- [Scalability and resilience: clusters, nodes, and shards](#scalability-and-resilience-clusters-nodes-and-shards)
- [-Set up Elasticsearch](#-set-up-elasticsearch)
- [--Configuring Elasticsearch](#--configuring-elasticsearch-1)
- [Config files location](#config-files-location)
- [Important Elasticsearch configuration](#important-elasticsearch-configuration)
- [-Index modules](#-index-modules)
- [Index Settings](#index-settings)
- [Static index settings](#static-index-settings)
- [Analysis](#analysis)
- [--Index Shard Allocation](#--index-shard-allocation)
- [Index-level shard allocation filtering](#index-level-shard-allocation-filtering)
- [--E-Index Shard Allocation](#--e-index-shard-allocation)
- [-Index templates](#-index-templates)
- [-Data streams](#-data-streams)
- [-Ingest pipelines](#-ingest-pipelines)
- [-Aliases](#-aliases)
- [-Data management](#-data-management)
- [--Concepts](#--concepts)
- [Index lifecycle](#index-lifecycle)
- [--END Concepts](#--end-concepts)
- [--Index lifecycle actions](#--index-lifecycle-actions)
- [--E-Index lifecycle actions](#--e-index-lifecycle-actions)
- [Query examples](#query-examples)
- [Limited size](#limited-size)
- [By field](#by-field)
- [By phrases phase](#by-phrases-phase)
- [By multiple conditions](#by-multiple-conditions)
- [Sort](#sort)
- [Terms look up(join)](#terms-look-upjoin)
- [Mapping](#mapping)
- [Dynamic mapping](#dynamic-mapping-1)
- [Explicit mapping](#explicit-mapping-1)
- [Search your data](#search-your-data)
- [The search api](#the-search-api)
  - [Sort search results](#sort-search-results)
    - [Sort mode option](#sort-mode-option)
    - [Sorting numeric fields](#sorting-numeric-fields)
    - [Sorting within nested objects](#sorting-within-nested-objects)
  - [Filter search results](#filter-search-results)
    - [Post filter](#post-filter)
- [Query DSL](#query-dsl)
- [Query and filter context](#query-and-filter-context)
  - [Relevance scores](#relevance-scores)
  - [Query context](#query-context)
- [Ways for data synchronization](#ways-for-data-synchronization)
  - [同步双写](#同步双写)
  - [异步双写](#异步双写)
  - [计划作业](#计划作业)
  - [Binlog](#binlog)
  - [Cannel](#cannel)
- [Testing data see also project `labs\elasticsearch`](#testing-data-see-also-project-labselasticsearch)


https://www.elastic.co/guide/en/elasticsearch/reference/8.15/documents-indices.html





## - 8.15

## --Elasticsearch basics

## Indices, documents, and fields

https://www.elastic.co/guide/en/elasticsearch/reference/8.15/documents-indices.html


The index is the fundamental unit of storage in Elasticsearch, a logical namespace for storing data that share similar characteristics.

### Documents and fields

Elasticsearch serializes and stores data in the form of JSON documents. A document is a set of fields, which are key-value pairs that contain your data.

### Mappings and data types

`Mapping > Index > Document > Fields`

Each index has a mapping or schema for how the fields in your documents are indexed.  
A mapping defines the data type for each field, how the field should be indexed, and how it should be stored. 


## Get ready for production

https://www.elastic.co/guide/en/elasticsearch/reference/8.15/scalability.html


### Use multiple nodes and shards



<span style='font-size: 16px;font-weight: 500'>Index and shards</span>  

Elastic is able to distribute your data across nodes by subdividing *an index into shards*.  

Each index in Elasticsearch is a grouping of one or more physical shards, where each shard is a self-contained Lucene index containing a subset of the documents in the index.  

By distributing the documents in an index across multiple shards, and distributing those shards across multiple nodes, Elasticsearch increases indexing and query capacity.



<span style='font-size: 16px;font-weight: 500'>Shard types</span>  

There are two types of shards: *primaries* and *replicas*.

Each document in an index belongs to one <u>primary shard</u>. 

<br/>

**replica shards**

A replica shard is a copy of a primary shard. Replicas maintain redundant copies of your data across the nodes in your cluster. 

This protects against hardware failure and increases capacity to serve read requests like searching or retrieving a document.


## --Configuring Elasticsearch

## Shard allocation, relocation, and recovery

https://www.elastic.co/guide/en/elasticsearch/reference/current/shard-allocation-relocation-recovery.html


<span style='font-size: 16px;font-weight: 500'>Replicas tasks</span>  

Replicas maintain redundant copies of your data across the nodes in your cluster, protecting against hardware failure and increasing capacity to serve read requests like searching or retrieving a document.  



## --Mapping

https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html

Mapping is the process of defining how a document, and the fields it contains, are stored and indexed.

When mapping your data, you create a mapping definition, which contains a list of fields that are pertinent to the document. 

### Dynamic mapping

Elasticsearch automatically attempts to detect the data type of fields in your documents. This allows you to get started quickly by just adding data to an index. 

### Explicit mapping

Use explicit mapping to define exactly how data types are mapped to fields, customized to your specific use case.

## --Index modules

https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules.html

Index Modules are modules created per index and control all aspects related to an index.





## -----

## Indices, documents, and fields


## What is the ES

- ES is a distributed document store.
- data **have been serialized** as JSON documents.
- data **can be accessed immediately** from any node.
  
## Inverted index

- An **inverted index** lists every *unique word* that appears in any document and identifies all of the documents each word occurs in.
- An index can be thought of as an optimized collection of documents and each document is a collection of fields,


## Information out: search and analyze

## testing purposes

- submit requests directly from the command line.
- Developer Console in Kibana.


## Searching your data
### Quering types
- The Elasticsearch REST APIs support .
  - structured queries.
  - full text queries.
  - complex queries that combine the two.

## Analyzing your data

- to build complex summaries of your data and gain insight into **key metrics, patterns, and trends**.

## Scalability and resilience: clusters, nodes, and shards

- You can add servers (nodes) to a cluster *to increase capacity* and Elasticsearch automatically  
  distributes your data and query load across *all of the available nodes*.

- An Elasticsearch index is really just a logical grouping *of one or more physical shards*.

<span style='font-size: 15px;'>**What's an index**</span>  

an Elasticsearch index is really just <u>a logical grouping</u> of one or more physical shards, where each shard is actually a self-contained index.  

By distributing the documents in an index across multiple shards, and distributing those shards across multiple nodes, Elasticsearch can ensure redundancy, which both protects against hardware failures and increases query capacity as nodes are added to a cluster. As the cluster grows (or shrinks), Elasticsearch automatically migrates shards to rebalance the cluster.


## -Set up Elasticsearch

This section includes information on how to setup Elasticsearch and get it running, including:  
- Downloading
- Installing
- Starting
- Configuring

## --Configuring Elasticsearch

## Config files location

Elasticsearch has three configuration files:

- `elasticsearch.yml` for configuring Elasticsearch
- `jvm.options` for configuring Elasticsearch JVM settings
- `log4j2.properties` for configuring Elasticsearch logging

These files are located in the config directory

## Important Elasticsearch configuration

https://www.elastic.co/guide/en/elasticsearch/reference/current/important-settings.html

## -Index modules

Index Modules are modules created per index and control all aspects related to an index.

## Index Settings

Index level settings can be set per-index. Settings may be:

<span style='font-size: 15px;'>**static**</span>  

They can only be set at <u>index creation time</u> or on <u>[a closed index](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-open-close.html)</u>, or by using the <u>update-index-settings API</u> with the reopen query parameter set to true (which automatically closes and reopens impacted indices).

<span style='font-size: 15px;'>**dynamic**</span>  

They can be changed on a live index using the <u>update-index-settings API</u>.  

## Static index settings

- `index.number_of_shards`  
  The number of primary shards that an index should have. Defaults to 1.  
  This setting can only be set at index creation time.  
  It cannot be changed on a closed index.

## Analysis

The index analysis module acts as a configurable registry of analyzers that can be used in order to convert a string field into individual terms which are:

- added to the inverted index in order to make the document searchable
- used by high level queries such as the match query to generate search terms.

See Text analysis for configuration details.

## --Index Shard Allocation

This module provides per-index settings to control the allocation of shards to nodes:

- Shard allocation filtering: Controlling which shards are allocated to which nodes.
- Delayed allocation: Delaying allocation of unassigned shards caused by a node leaving.
- Total shards per node: A hard limit on the number of shards from the same index per node.
- Data tier allocation: Controls the allocation of indices to data tiers.

## Index-level shard allocation filtering

You can use shard allocation filters to control where Elasticsearch allocates shards of a particular index.  


Shard allocation filters can be based on custom node attributes or the built-in `_name, _host_ip, _publish_ip, _ip, _host, _id, _tier and _tier_preference` attributes.

## --E-Index Shard Allocation


## -Index templates

An index template is a way to tell Elasticsearch how to configure an index when it is created.

## -Data streams

A data stream lets you store append-only time series data across multiple indices while giving you a single named resource for requests.  
Data streams are well-suited for logs, events, metrics, and other continuously generated data.

## -Ingest pipelines

Ingest pipelines let you perform common transformations on your data before indexing.

## -Aliases

An alias is a secondary name for a group of data streams or indices. Most Elasticsearch APIs accept an alias in place of a data stream or index name.

## -Data management

https://www.elastic.co/guide/en/elasticsearch/reference/current/data-management.html

## --Concepts


## Index lifecycle

https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-index-lifecycle.html

- Hot: The index is actively being updated and queried.
- Warm: The index is no longer being updated but is still being queried.
- Cold: The index is no longer being updated and is queried infrequently. The information still needs - to be searchable, but it’s okay if those queries are slower.
- Frozen: The index is no longer being updated and is queried rarely. The information still needs to be 
- searchable, but it’s okay if those queries are extremely slow.
- Delete: The index is no longer needed and can safely be removed.

## --END Concepts

ILM & Data stream lifecycle

## --Index lifecycle actions

https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-actions.html



## --E-Index lifecycle actions

## Query examples

## Limited size
```json
{
    "query": {
        "bool": {
        }
    },
    "from": 0,
    "size": 1
}
```

## By field
```json
{
    "query": {
        "match": {
            "name": "Larry"
        }
    }
}
```

## By phrases phase

```json
{
    "query": {
        "match_phrase": {
            "description": "experienced"
        }
    }
}
```

## By multiple conditions

```json
{
  "query": {
    "bool": {
      "must": [
        { "match": { "age": "40" } }
      ],
      "must_not": [
        { "match": { "resigned": false } }
      ]
    }
  }
}
```

## Sort

```json
{
  "sort": [
    { "id": "asc" }
  ],
  "from": 0,
  "size": 50,
  "query": {
    "bool": {
      "must": [
        { "match": { "age": "40" } }
      ],
      "must_not": [
        { "match": { "resigned": false } }
      ]
    }
  }
}
```

## Terms look up(join)

[Terms look up](https://blog.csdn.net/UbuntuTouch/article/details/112857984)

##  [Mapping](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html)

- Mapping is the process of defining how a document, and the fields it contains, are stored and indexed.

## Dynamic mapping

- it tries to get out of your way and let you start exploring your data as quickly as possible.

## Explicit mapping

- to specify your own explicit mappings.



##  [Search your data](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-with-elasticsearch.html)

## The search api

### [Sort search results](https://www.elastic.co/guide/en/elasticsearch/reference/current/sort-search-results.html#sort-search-results)

#### Sort mode option

#### Sorting numeric fields
- to cast the values from one type to another

#### Sorting within nested objects

### [Filter search results](https://www.elastic.co/guide/en/elasticsearch/reference/current/filter-search-results.html)

#### Post filter

- the search hits are filtered after the aggregations are calculated.

##  [Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html)

## Query and filter context

### Relevance scores

- By default, Elasticsearch sorts matching search results by relevance score,   
  which measures how well each document matches a query.

### Query context

- the query clause also calculates a relevance score in the `_score` metadata field.


##  Ways for data synchronization 

https://zhuanlan.zhihu.com/p/659792107

### 同步双写

### 异步双写

### 计划作业

### Binlog

### Cannel

## Testing data see also project `labs\elasticsearch`

[doc](https://www.elastic.co/guide/en/elasticsearch/reference/current/elasticsearch-intro.html)

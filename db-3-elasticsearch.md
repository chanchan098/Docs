# db-3-elasticsearch.md

# elasticsearch(8.12)

# What is elasticsearch

- the distributed search and analytics engine
- provides near real-time search and analytics for all types of data

----------

- use cases
  - Add **a search box** to an app or website
  - Store and analyze **logs, metrics, and security event data**
  - Use **machine learning** to automatically model the behavior of your data in real time
  - Use Elasticsearch as **a vector database** to create, store, and search vector embeddings
  - Automate **business workflows** using Elasticsearch as a storage engine
  - Manage, integrate, and analyze spatial information using Elasticsearch as a geographic information system (**GIS**)
  - Store and process genetic data using Elasticsearch as a bioinformatics research tool


## Data in: documents and indices

### What is the ES

- ES is a distributed document store.
- data **have been serialized** as JSON documents.
- data **can be accessed immediately** from any node.
  
### Inverted index

- An **inverted index** lists every *unique word* that appears in any document and identifies all of the documents each word occurs in.
- An index can be thought of as an optimized collection of documents and each document is a collection of fields,


## Information out: search and analyze

### testing purposes

- submit requests directly from the command line.
- Developer Console in Kibana.


### Searching your data
#### Quering types
- The Elasticsearch REST APIs support .
  - structured queries.
  - full text queries.
  - complex queries that combine the two.

### Analyzing your data

- to build complex summaries of your data and gain insight into **key metrics, patterns, and trends**.

## Scalability and resilience: clusters, nodes, and shards

- You can add servers (nodes) to a cluster **to increase capacity** and Elasticsearch automatically  
  distributes your data and query load across **all of the available nodes**.

- An Elasticsearch index is really just a logical grouping **of one or more physical shards**.

# Query examples

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

# [Mapping](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html)

- Mapping is the process of defining how a document, and the fields it contains, are stored and indexed.

## Dynamic mapping

- it tries to get out of your way and let you start exploring your data as quickly as possible.

## Explicit mapping

- to specify your own explicit mappings.



# [Search your data](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-with-elasticsearch.html)

## The search api

### [Sort search results](https://www.elastic.co/guide/en/elasticsearch/reference/current/sort-search-results.html#sort-search-results)

#### Sort mode option

#### Sorting numeric fields
- to cast the values from one type to another

#### Sorting within nested objects

### [Filter search results](https://www.elastic.co/guide/en/elasticsearch/reference/current/filter-search-results.html)

#### Post filter

- the search hits are filtered after the aggregations are calculated.

# [Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html)

## Query and filter context

### Relevance scores
- By default, Elasticsearch sorts matching search results by relevance score,   
  which measures how well each document matches a query.

### Query context

- the query clause also calculates a relevance score in the `_score` metadata field.

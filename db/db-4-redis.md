# - About 

<https://redis.io/docs/about/>

**in-memory data structure store** used as a database, cache, message broker, and streaming engine.  

Redis provides data structures such as **strings, hashes, lists, sets, sorted sets** with range queries, bitmaps, hyperloglogs, geospatial indexes, and streams.  

Redis has **built-in replication**, Lua scripting, LRU eviction, transactions, and different levels of **on-disk persistence**, and provides **high availability** via Redis Sentinel and automatic partitioning with Redis Cluster.


# -Connect

# CLI

In interactive mode, redis-cli has basic line editing capabilities to provide a familiar typing experience.

# -Understand Redis data types

# Sorted sets

A Redis sorted set is a collection of unique strings (members) ordered by an associated score.  


*Manage Redis/*
# Redis persistence

<https://redis.io/docs/management/persistence/>

**persistence options.**
- RDB (Redis Database): RDB persistence performs point-in-time snapshots of your dataset at specified intervals.
- AOF (Append Only File): AOF persistence logs every write operation received by the server. These operations can then be replayed again at server startup, reconstructing the original dataset. Commands are logged using the same format as the Redis protocol itself.
- No persistence: You can disable persistence completely. This is sometimes used when caching.
- RDB + AOF: You can also combine both AOF and RDB in the same instance.


# Commands

https://redis.io/docs/latest/commands/

## EXPIRE

https://redis.io/docs/latest/commands/expire/

[expire key](https://javaguide.cn/database/redis/redis-questions-01.html#redis-%E6%98%AF%E5%A6%82%E4%BD%95%E5%88%A4%E6%96%AD%E6%95%B0%E6%8D%AE%E6%98%AF%E5%90%A6%E8%BF%87%E6%9C%9F%E7%9A%84%E5%91%A2)



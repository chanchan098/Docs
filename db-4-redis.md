# db-4-redis.md

# Introduction to Redis 

<https://redis.io/docs/about/>

**in-memory data structure store** used as a database, cache, message broker, and streaming engine.  

Redis provides data structures such as **strings, hashes, lists, sets, sorted sets** with range queries, bitmaps, hyperloglogs, geospatial indexes, and streams.  

Redis has **built-in replication**, Lua scripting, LRU eviction, transactions, and different levels of **on-disk persistence**, and provides **high availability** via Redis Sentinel and automatic partitioning with Redis Cluster.

# Redis persistence

<https://redis.io/docs/management/persistence/>

**persistence options.**
- RDB (Redis Database): RDB persistence performs point-in-time snapshots of your dataset at specified intervals.
- AOF (Append Only File): AOF persistence logs every write operation received by the server. These operations can then be replayed again at server startup, reconstructing the original dataset. Commands are logged using the same format as the Redis protocol itself.
- No persistence: You can disable persistence completely. This is sometimes used when caching.
- RDB + AOF: You can also combine both AOF and RDB in the same instance.

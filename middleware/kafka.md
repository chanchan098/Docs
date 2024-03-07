# mid-2-kafka.md

# Introduction

<https://kafka.apache.org/documentation/#introduction>

## Main Concepts and Terminology

- event  
  An **event** records the fact that "something happened" in the world or in your business. 
  It is also called **record or message** in the documentation.

- Producers  
  Producers are those client applications that publish (write) events to Kafka

- consumers  
  consumers are those that subscribe to (read and process) these events.

- topics  
  Events are organized and durably stored in topics.  
  Very simplified, a topic is similar to a folder in a filesystem, and the events are the files in that folder.

- partitioned  
  Topics are partitioned, meaning a topic is spread over a number of "buckets" located on different Kafka brokers. 

  
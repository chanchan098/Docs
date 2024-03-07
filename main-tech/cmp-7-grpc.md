# cmp-7-grpc.md
# Intro

[Intro](https://grpc.io/docs/what-is-grpc/introduction/)


## Overview

A client application can directly call a method on a server application on a different  
machine as if it were a local object.

![alt](https://grpc.io/img/landing-2.svg)

## Working with Protocol Buffers 

[official introduction](https://protobuf.dev/overview/)

- For serializing structured data.

# Core concepts

[concepts](https://grpc.io/docs/what-is-grpc/core-concepts/)

## Service definition

- GRPC uses protocol buffers as the Interface Definition Language (IDL) for describing  
  both the service interface and the structure of the payload messages.

```
service HelloService {
  rpc SayHello (HelloRequest) returns (HelloResponse);
}

message HelloRequest {
  string greeting = 1;
}

message HelloResponse {
  string reply = 1;
}
```

### Define four kinds of service method

- Unary RPCs
- Server streaming RPCs 
- Client streaming RPCs 
- Bidirectional streaming RPCs

### Unary RPC

Here the client sends a single request and gets back a single response.

### Server streaming RPC

The server returns **a stream of** messages in response to a client’s request.  
After sending all its messages, the server’s status details (status code and  
optional status message) and optional trailing metadata **are sent** to the client.  
This completes processing on the server side. The client completes once it has  
all the server’s messages.

### Client streaming RPC

The client sends **a stream of** messages to the server instead of a single message.  
The server responds with **a single** message (along with its status details and optional  
trailing metadata), typically but not necessarily after it has received all the client’s  
messages.

### Bidirectional streaming RPC
The server can choose to send back its initial metadata or wait for the client to start  
streaming messages.

Since the two streams are independent, the client and server can read and write messages  
in any order.
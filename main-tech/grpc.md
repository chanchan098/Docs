# grpc.md

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

## RPC life cycle 

### Unary RPC

Here the client sends a single request and gets back a single response.

### Server streaming RPC

<span style='font-size: 15px;'>**streaming return**</span>  
A server-streaming RPC is similar to a unary RPC, except that the server returns a stream of messages in response to a client’s request.


<span style='font-size: 15px;'>**trailing metadata**</span>  
After sending all its messages, the server’s status *details* (status code and  
optional status message) and *optional trailing metadata* are sent to the client.  
This completes processing on the server side. 


The client completes once it has all the server’s messages.

### Client streaming RPC

<span style='font-size: 15px;'>**streaming sending**</span>  
The client sends *a stream of* messages to the server instead of a single message.  

<span style='font-size: 15px;'>**single message**</span>  
The server responds with *a single* message (along with its status details and optional  
trailing metadata), typically but not necessarily after it has received all the client’s  
messages.

### Bidirectional streaming RPC
In a bidirectional streaming RPC, the call is initiated by the client invoking the method and the server receiving the client metadata, method name, and deadline.  
The server can choose to send back its initial metadata or wait for the client to start streaming messages.

Since the two streams are independent, the client and server can read and write messages  
in any order.

## Deadlines/Timeouts 

gRPC allows clients to specify how long they are willing to wait for an RPC to complete before the RPC is terminated with a `DEADLINE_EXCEEDED` error.  

On the server side, the server can query to see if a particular RPC has timed out, or how much time is left to complete the RPC.


## RPC termination 

<span style='font-size: 15px;'>**states not matched**</span>  
In gRPC, both the client and server make independent and local determinations of the success of the call, and their conclusions may not match.  


for example, you could have an RPC that finishes successfully on the server side (“I have sent all my responses!”) but fails on the client side (“The responses arrived after my deadline!”).  
It’s also possible for a server to decide to complete before a client has sent all its requests.

## Cancelling an RPC 

Either the client or the server can cancel an RPC at any time. A cancellation terminates the RPC immediately so that no further work is done.

>**Warning**  
>Changes made before a cancellation are not rolled back.

## Metadata

Metadata is information about *a particular RPC call* (such as authentication details) in the form of a list of key-value pairs,  
where the keys are strings and the values are typically strings,  
but can be binary data.

<span style='font-size: 15px;'>**keys spec**</span>  
Keys are case insensitive and consist of ASCII letters, digits, and special characters `-`, `_`, `.` and must not start with `grpc-` (which is reserved for gRPC itself).  
Binary-valued keys end in -bin while ASCII-valued keys do not.

<span style='font-size: 15px;'>**User-defined metadata**</span>  
User-defined metadata is not used by gRPC, which allows the client to provide information associated with the call to the server and *vice versa*.

## Channels 

A gRPC channel provides a connection to a gRPC server on a specified host and port. It is used when creating a client stub.

Clients can specify channel arguments to modify gRPC’s default behavior, such as switching message compression `on` or `off`. A channel has state, including `connected` and `idle`.
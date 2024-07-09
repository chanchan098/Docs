[rfc6749](https://datatracker.ietf.org/doc/html/rfc6749)

## 1

## 1.1.  Roles

resource owner  
    An entity capable of granting access to a protected resource.
    When the resource owner is a person, it is referred to as an
    end-user.

resource server  
    The server hosting the protected resources, capable of accepting
    and responding to protected resource requests using access tokens.

client  
    An application making protected resource requests on behalf of the
    resource owner and with its authorization.  The term "client" does
    not imply any particular implementation characteristics (e.g.,
    whether the application executes on a server, a desktop, or other
    devices).

authorization server  
    The server issuing access tokens to the client after successfully
    authenticating the resource owner and obtaining authorization.

## 1.3. Authorization Grant

<u>An authorization grant</u> is a credential representing the resource owner's authorization (to access its protected resources) used by the client to obtain an access token.

This specification defines four grant types  
-- authorization code, implicit, resource owner password credentials, and client credentials  
-- as well as an extensibility mechanism for defining additional types.

## 1.3.1.  Authorization Code

<span style='font-size: 15px;'>**What is it**</span>  
The authorization code is obtained by using an authorization server as an intermediary between the client and resource owner.

## 1.3.2.  Implicit

<span style='font-size: 15px;'>**What is it**</span>  
In the implicit flow, instead of issuing the client an authorization code, the client is issued an access token directly (as the result of the resource owner authorization). The grant type is implicit, as no intermediate credentials (such as an authorization code) are issued (and later used to obtain an access token).



## 1.3.3.  Resource Owner Password Credentials

<span style='font-size: 15px;'>**What is it**</span>  
The resource owner password credentials (i.e., username and password) can be used directly as an authorization grant to obtain an access token.  

<span style='font-size: 15px;'>**When use it**</span>  
The credentials should only be used when there is a high degree of trust between the resource owner and the client (e.g., the client is part of the device operating system or a highly privileged application), and when other authorization grant types are not available (such as an authorization code).

## 1.3.4.  Client Credentials

<span style='font-size: 15px;'>**When to use**</span>  
when the authorization scope is limited to the protected resources under the control of the client, or to protected resources previously arranged with the authorization server.

Client credentials are used as an authorization grant typically when the client is acting on its own behalf (the client is also the resource owner) or is requesting access to protected resources based on an authorization previously arranged with the authorization server.

## 4.  Obtaining Authorization

## 4.2.  Implicit Grant

```

     +----------+
     | Resource |
     |  Owner   |
     |          |
     +----------+
          ^
          |
         (B)
     +----|-----+          Client Identifier     +---------------+
     |         -+----(A)-- & Redirection URI --->|               |
     |  User-   |                                | Authorization |
     |  Agent  -|----(B)-- User authenticates -->|     Server    |
     |          |                                |               |
     |          |<---(C)--- Redirection URI ----<|               |
     |          |          with Access Token     +---------------+
     |          |            in Fragment
     |          |                                +---------------+
     |          |----(D)--- Redirection URI ---->|   Web-Hosted  |
     |          |          without Fragment      |     Client    |
     |          |                                |    Resource   |
     |     (F)  |<---(E)------- Script ---------<|               |
     |          |                                +---------------+
     +-|--------+
       |    |
      (A)  (G) Access Token
       |    |
       ^    v
     +---------+
     |         |
     |  Client |
     |         |
     +---------+

   Note: The lines illustrating steps (A) and (B) are broken into two
   parts as they pass through the user-agent.

                       Figure 4: Implicit Grant Flow

```


## 4.1.  Authorization Code Grant

The authorization code grant type is used to obtain both access
tokens and refresh tokens and is optimized for confidential clients.
```
     +----------+
     | Resource |
     |   Owner  |
     |          |
     +----------+
          ^
          |
         (B)
     +----|-----+          Client Identifier      +---------------+
     |         -+----(A)-- & Redirection URI ---->|               |
     |  User-   |                                 | Authorization |
     |  Agent  -+----(B)-- User authenticates --->|     Server    |
     |          |                                 |               |
     |         -+----(C)-- Authorization Code ---<|               |
     +-|----|---+                                 +---------------+
       |    |                                         ^      v
      (A)  (C)                                        |      |
       |    |                                         |      |
       ^    v                                         |      |
     +---------+                                      |      |
     |         |>---(D)-- Authorization Code ---------'      |
     |  Client |          & Redirection URI                  |
     |         |                                             |
     |         |<---(E)----- Access Token -------------------'
     +---------+       (w/ Optional Refresh Token)
```

Note: The lines illustrating steps (A), (B), and (C) are broken into  
two parts as they pass through the user-agent.

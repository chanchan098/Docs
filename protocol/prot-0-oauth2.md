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

## 4.  Obtaining Authorization

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

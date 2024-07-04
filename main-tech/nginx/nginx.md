
https://nginx.org/en/docs/beginners_guide.html

# -Admin Guide/HTTP Load Balancing

# HTTP Load Balancing

## Overview

is a commonly used technique for optimizing resource utilization, maximizing throughput, reducing latency, and ensuring fault‑tolerant configurations.

## Proxying HTTP Traffic to a Group of Servers

<span style='font-size: 15px;'>**define server groups**</span>  
1. need to define the group with the `upstream` directive. The directive is placed in the `http` context.
2. Servers in the group are configured using the `server` directive.
  
for example 
```nginx
http {
    upstream backend {
        server backend1.example.com weight=5;
        server backend2.example.com;
        server 192.0.0.1 backup;
    }
}
```

<span style='font-size: 15px;'>**used**</span>  
To pass requests to a server group, the name of the group is specified in the `proxy_pass` directive

```nginx
server {
    location / {
        proxy_pass http://backend;
    }
}
```


<span style='font-size: 15px;'>**final**</span>  
Because no load‑balancing algorithm is specified in the upstream block, NGINX uses the default algorithm, *Round Robin*:
```nginx
http {
    upstream backend {
        server backend1.example.com;
        server backend2.example.com;
        server 192.0.0.1 backup;
    }
    
    server {
        location / {
            proxy_pass http://backend;
        }
    }
}
```

## Choosing a Load-Balancing Method

NGINX Open Source supports *four* load‑balancing methods:

1. `Round Robin` – Requests are distributed *evenly* across the servers, with server weights taken into consideration. This method is used by default (there is no directive for enabling it):
    ```nginx
    upstream backend {
      # no load balancing method is specified for Round Robin
      server backend1.example.com;
      server backend2.example.com;
    }
    ```

2. `Least Connections` – A request is sent to the server with the least number of active connections, again with server weights taken into consideration:
   ```nginx
    upstream backend {
      least_conn;
      server backend1.example.com;
      server backend2.example.com;
    }
   ```

3. `IP Hash` – The server to which a request is sent is determined from the client IP address.  
   In this case, either the first three octets of the IPv4 address or the whole IPv6 address are used to calculate the hash value.  
   The method guarantees that requests from the same address get to the same server unless it is not available.  
   ```nginx
    upstream backend {
      server backend1.example.com;
      server backend2.example.com;
      server backend3.example.com down;
    }
   ```

4. `Generic Hash` – The server to which a request is sent is determined from a user‑defined key which can be a text string, variable, or a combination.  
   For example, the key may be a paired source IP address and port, or a URI as in this example:  
   ```nginx
    upstream backend {
      hash $request_uri consistent;
      server backend1.example.com;
      server backend2.example.com;
    } 
   ```
   
## Server Weights

By default, NGINX distributes requests among the servers in the group according to their weights using the Round Robin method.  
The weight parameter to the server directive sets the weight of a server; the default is 1:
```nginx
upstream backend {
    server backend1.example.com weight=5;
    server backend2.example.com;
    server 192.0.0.1 backup;
}
```

With this configuration of weights, out of every 6 requests, 5 are sent to `backend1.example.com` and 1 to `backend2.example.com.`

## （Plus）Server Slow-Start

The server slow‑start feature prevents <u>a recently recovered server</u> from being overwhelmed by connections, which may time out and cause the server to be marked as failed *again*.

## Enabling Session Persistence

identifies user sessions and routes all requests in a given session to the same upstream server.

NGINX Plus supports three session persistence methods. The methods are set with the sticky directive.  
(For session persistence with NGINX Open Source, use the `hash` or `ip_hash` directive as described above.)

# -Admin Guide/Web Server
 
*Admin Guide/Web Server/*
# Configuring NGINX and NGINX Plus as a Web Server

[doc](https://docs.nginx.com/nginx/admin-guide/web-server/web-server/)

## Setting Up Virtual Servers

A virtual server is defined by a server `directive` in the `http` context, for example:

```nginx
http {
    server {
        # Server configuration
    }
}
```

It is possible to add **multiple server directives** into the http context to define multiple virtual servers.

### Listen on port and address

The server configuration block usually includes **a listen directive** to specify the IP address and port (or Unix domain socket and path) on which the server listens for requests. Both IPv4 and IPv6 addresses are accepted; enclose IPv6 addresses **in square brackets**.

```nginx
server {
    listen 127.0.0.1:8080;
    # Additional server configuration
}
```

If a port is omitted, the **standard port** is used. Likewise, if an address is omitted, the server listens on **all addresses**.

### Set server name

The parameter to server_name can be **a full (exact) name, a wildcard, or a regular expression.**  

- **exact name**  
  ```nginx
    server {
        listen      80;
        server_name example.org www.example.org;
        #...
    }
  ```

- **wildcard name**  
  ```nginx
    server {
        listen      80;
        server_name *.example.org;
        #...
    }
  ```

### Route to default server

If the Host header field does not match a server name, NGINX Plus routes the request to **the default server** for the port on which the request arrived.

- **specify default server**  
  ```nginx
    server {
        listen 80 default_server;
        #...
    }
  ```
The default server is *the first one* listed in the nginx.conf file,  
unless you include the default_server parameter to the listen directive to explicitly designate a server as the default.

## Configuring Locations

- Distributed delivery   
  NGINX Plus can send traffic to **different proxies** or **serve different files** based on the request URIs. These blocks are defined using **the location directive** placed *within a server directive*.  

  For example, you can define three location blocks to instruct the virtual server  
  to send *some requests* to one proxied server, send *other requests* to a different proxied server, and serve *the rest of the requests* by delivering files from the local file system.

### prefix strings

matches request URIs that begin with `/some/path/`, such as `/some/path/document.html`.

```nginx
location /some/path/ {
    #...
}
```


### regular expression

A regular expression is preceded with the tilde (~) for *case-sensitive* matching, or the tilde-asterisk (~*) for *case-insensitive* matching. The following example matches URIs that include the string `.html` or `.htm` in any position.

```nginx
location ~ \.html? {
    #...
}
```

### doc-NGINX Location Priority

## Using Variables

A variable is denoted by the $ (dollar) sign at the beginning of its name.

## doc-Returning Specific Status Codes

## Rewriting URIs in Requests

A request URI can be modified multiple times during request processing through the use of the `rewrite directive`, which has **one optional** and **two required parameters**. 

- first  
  The first (required) parameter is the regular expression that the request URI must match.
- second  
  The second parameter is the URI to substitute for the matching URI.
- third  
  The optional third parameter is a flag that can halt processing of further rewrite directives or send a redirect (code 301 or 302).

```nginx
location /users/ {
    rewrite ^/users/(.*)$ /show?user=$1 break;
}
```

## Rewriting HTTP Responses

substituting one string for another.

For example, you can change absolute links that refer to a server other than the proxy:

```nginx
location / {
    sub_filter      /blog/ /blog-staging/;
    sub_filter_once off;
}
```

Another example changes the scheme from `http://` to `https://` and replaces the `localhost` address with the hostname from the request header field.  
The `sub_filter_once` directive tells NGINX to apply sub_filter directives consecutively within a location:

```nginx
location / {
    sub_filter     'href="http://127.0.0.1:8080/'    'href="https://$host/';
    sub_filter     'img src="http://127.0.0.1:8080/' 'img src="https://$host/';
    sub_filter_once on;
}
```

## Handling Errors

*Admin Guide/Web Server/*
# NGINX Reverse Proxy-Web 

Configure NGINX as a reverse proxy for HTTP and other protocols, with support for modifying request headers and fine-tuned buffering of responses.

## Passing a Request to a Proxied Server

When NGINX proxies a request, it sends the request to a specified proxied server, fetches the response, and sends it back to the client.

To pass a request to an HTTP proxied server, the `proxy_pass` directive is specified inside a location.  
For example:

```nginx
location /some/path/ {
    proxy_pass http://www.example.com/link/;
}
```

## doc-Passing Request Headers


## Configuring Buffers


- proxy_buffers  
  the size and the number of buffers allocated for a request. 

- proxy_buffer_size  
  The first part of the response from a proxied server is stored in a separate buffer, the size of which is set with the proxy_buffer_size directive.



- toggle buffering   
  The directive that is responsible for enabling and disabling buffering is `proxy_buffering`.  
  By default it is set to on and buffering is enabled.

```nginx
location /some/path/ {
    proxy_buffering off;
    proxy_pass http://localhost:8000;
}
```

## Choosing an Outgoing IP Address

If your proxy server has **several network interfaces**, sometimes you might need to choose `a particular source IP address` for connecting to *a proxied server or an upstream*.



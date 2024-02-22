# Configuring NGINX and NGINX Plus as a Web Server-Web Server

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

# NGINX Reverse Proxy-Web Server

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



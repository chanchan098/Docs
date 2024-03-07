# nginx.md

# Windows

At *nginx/conf/nginx.conf*

## [doc](https://nginx.org/en/docs/)

## Template
```
http {    
    server {
        # root node and children
        location {}
    }
}
```

## Example

<details>
<summary>Example</summary>

```
http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;

    gzip  on;


    upstream myapp1 {
        server 127.0.0.1:9000;
        server 127.0.0.1:8089;    
    }


    server {
        listen       8088;
        server_name  localhost;

        location / {
            proxy_pass http://myapp1;
        }

        
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }

    server {
        listen 8089;
        server_name resouce_server;
        
        location / {
            root   html_resource;
            sendfile on;
            autoindex on;
            autoindex_exact_size on;
            autoindex_localtime on;
            charset gbk;
        }

        location /txt/ {
            root html_resource;
            sendfile on;
            autoindex on;
            autoindex_exact_size on;
            autoindex_localtime on;
            charset gbk;
        }

        location /txt2/ {
            root html_resource;
            sendfile on;
            autoindex on;
            autoindex_exact_size on;
            autoindex_localtime on;
            charset gbk;
        }

        location /resource/ {
            root html_resource;
            sendfile on;
            autoindex on;
            autoindex_exact_size on;
            autoindex_localtime on;
            charset gbk;
        }    
    }

    server {
        listen 9000;
        server_name proxy_server;
        
        location / {
            proxy_pass http://localhost:8089/;
        }
    }
}
```

</details>

# Ubuntu

## [Install](https://nginx.org/en/linux_packages.html#Ubuntu)

## Location installed 

- */etc/nginx*

- root config file */etc/nginx/nginx.conf*
- other config files */etc/nginx/conf.d*

## Include all in root config file

```
...
http {
   ...
    # include all 
    include /etc/nginx/conf.d/*.conf;
}
```
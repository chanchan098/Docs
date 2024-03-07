# ops-1.1-dns.md

# What is DNS?

<https://www.cloudflare.com/learning/dns/what-is-dns/>

The Domain Name System (DNS) is the phonebook of the Internet. 

DNS translates domain names to IP addresses so browsers can load Internet resources.

# Server types

<https://www.cloudflare.com/learning/dns/dns-server-types/>

four categories
- Recursive resolvers
- root nameservers
- TLD nameservers
- authoritative nameservers


In a typical DNS lookup (when there is no caching in play),  
these four DNS servers work together in harmony to complete the task of *delivering the IP address*  
for a specified domain to the client (the client is usually `a stub resolver` - a simple resolver built  
into an operating system).  

<details>
<summary>dns resolution</summary>

![alt](https://www.cloudflare.com/img/learning/dns/dns-server-types/recursive-resolver.png)

</details>

## DNS recursive resolver

<span style='font-size: 15px;'>**What it is?**</span>  
A recursive resolver (also known as a DNS recursor) is the `first stop` in a DNS query.  
The recursive resolver acts as *a middleman* between a client and a DNS nameserver.

<span style='font-size: 15px;'>**Respond client or redirecting to root server**</span>  
After receiving a DNS query from a web client,  

a recursive resolver will either respond with cached data, or send a request to `a root nameserver`,  
followed by another request to `a TLD nameserver`,  
and then one last request to `an authoritative nameserver`. 

<span style='font-size: 15px;'>**Respond to client**</span>  
After receiving a response from the authoritative nameserver containing `the requested IP address`,  
the recursive resolver then sends a response to the client.

<span style='font-size: 15px;'>**Caching**</span>  
During this process, the recursive resolver *will cache* information received from authoritative nameservers. 

next time  
When a client requests the IP address of a domain name that was recently requested by another client,  
the resolver can circumvent the process of communicating with the nameservers, and just deliver the client  
the requested record from its cache.

## DNS root nameserver

<span style='font-size: 15px;'>**Redirecting to **</span>  
A root server accepts a recursive resolver’s query which includes a domain name, and the *root nameserver*  
responds by directing the recursive resolver to *a TLD nameserver*, based on the extension of that domain (.com, .net, .org, etc.).

## TLD nameserver

<span style='font-size: 15px;'>**Redirecting to authoritative server**</span>  
If a user was searching for google.com, after receiving a response from a root nameserver, the recursive resolver would then send a query to a .com *TLD nameserver*,  
which would respond by pointing to the *authoritative nameserver* (see below) for that domain.

## Authoritative nameserver

<span style='font-size: 15px;'>**Present domain name**</span>  
The authoritative nameserver contains information specific to the domain name it serves (e.g. google.com) and it can provide a recursive resolver with the IP address of that server

# DNS records

<https://www.cloudflare.com/learning/dns/dns-records/>

- **A record**  
The record that holds the IP address of a domain.

- **AAAA record**  
The record that contains the IPv6 address for a domain (as opposed to A records, which list the IPv4 address).

- **CNAME record**  
Forwards one domain or subdomain to another domain, does NOT provide an IP address.

- **MX record**  
Directs mail to an email server. Learn more about the MX record.

- **TXT record**  
Lets an admin store text notes in the record. These records are often used for email security.

- **NS record**  
Stores the name server for a DNS entry.

- **SOA record**  
Stores admin information about a domain.

- **SRV record**  
Specifies a port for specific services.

- **PTR record**  
Provides a domain name in reverse-lookups.

## A record

## AAAA record

## DNS SRV record

However, SRV records are actually formatted in this way:  
`_service._proto.name. TTL class type of record priority weight port target.`

So our example SRV record would actually look like:  
`_xmpp._tcp.example.com. 86400 IN SRV 10 5 5223 server.example.com.`

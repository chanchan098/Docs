# prot-2-tls.md

[rfc 2246](https://datatracker.ietf.org/doc/html/rfc2246#autoid-1)

## 6. The TLS Record Protocol

The Record Protocol takes messages  
- to be transmitted,
- fragments the data into manageable blocks,
- optionally compresses the data,
- applies a MAC,
- encrypts,
- and transmits the result.

Received data is decrypted, verified, decompressed, and reassembled, then delivered to higher level clients.

## 7. The TLS Handshake Protocol

### 7.4. Handshake protocol

This protocol is used to negotiate the secure attributes of a session.
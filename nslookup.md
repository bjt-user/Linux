```
$ nslookup www.google.com
Server:		192.168.2.1
Address:	192.168.2.1#53

Non-authoritative answer:
Name:	www.google.com
Address: 142.251.37.4
Name:	www.google.com
Address: 2a00:1450:4016:80b::2004
```
The first line `Server` is the IP of your local dns server.\
The `#53` means port 53.

#### specifying the nameserver

When your nameserver is `192.168.2.1`:
```
nslookup [hosttosearch] 192.168.2.1
```

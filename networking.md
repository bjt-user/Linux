#### packages

To do a
```
nslookup google.com
```
you need to install this:
```
sudo apt install dnsutils
```

The package `net-tools` is probably also very useful.
*This includes arp, ifconfig, netstat, rarp, nameif and route.*

#### curl

```
-I, --head
(HTTP FTP FILE) Fetch the headers only! HTTP-servers feature  the
command  HEAD  which this uses to get nothing but the header of a
document. When used on an FTP or FILE  file,  curl  displays  the
file size and last modification time only.
```

If you do
```
curl -I google.com
```
you get
```
HTTP/1.1 301 Moved Permanently
...
```
probably because it tries to connect over http and not https

This will get a different response:
```
HTTP/2 200
...
```

When my wireless connection breaks I get:
```
curl: (6) Could not resolve host: www.google.com
```

#### http response status codes

https://developer.mozilla.org/en-US/docs/Web/HTTP/Status

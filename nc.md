#### open a port

To listen on a specific port:
```
nc -l 443
```

#### check if a port is open

```
$ nc -vz 192.168.2.1 53
_gateway [192.168.2.1] 53 (domain) open
```

#### check if port is open and time out after 1 second

This will time out after 1 second if `nc` cannot access the port:
```
watch nc -vz -w 1 192.168.2.1 53
```

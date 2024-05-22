#### test ssh connectivity

```
echo 'quit' | telnet myhost 22
```

#### use timeout to come back after a couple of seconds

```
timeout 5 telnet 10.100.203.14 443
```
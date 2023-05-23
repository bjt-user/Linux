#### decode string

```
echo "NDAyMTYwHhcNMjIwMjAxMTEzNjA1WhcNMzMwMzA3MTEzNjA1WjA9MQswCQYDVQQG" | base64 --decode
```

***

#### encoding
```
$ echo "test" | base64
dGVzdAo=
bofo::/oracle/private $ echo "dGVzdAo=" | base64 --decode
test
```

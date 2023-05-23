#### decode string

```
echo "NDAyMTYwHhcNMjIwMjAxMTEzNjA1WhcNMzMwMzA3MTEzNjA1WjA9MQswCQYDVQQG" | base64 --decode
```

***

#### encoding
```
$ echo "test" | base64
dGVzdAo=
$ echo "dGVzdAo=" | base64 --decode
test
```

## troubleshooting

#### special character !

The `!` character can be problematic in bash:
```
$ echo "test!" | base64
-bash: !": event not found
$ echo test! | base64
dGVzdCEK
$ echo dGVzdCEK | base64 --decode
test!
```
So you dont use the double quotes when echoing into `base64`.

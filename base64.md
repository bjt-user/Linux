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

The `!` character can be problematic on some machines: (probably only ones with old bash versions)
```
$ echo "test!" | base64
-bash: !": event not found
```

this helps:
```
set +H
```

On most machines it works out of the box though:
```
$ echo "test!" | base64
dGVzdCEK
$ echo "dGVzdCEK" | base64 --decode
test!
```

But `set +H`  disables the `!` commands completely,\
so you have to enable it again with `set -H` afterwards.

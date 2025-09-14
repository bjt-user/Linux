## examples

#### substring

```
vim9script

var myvar = matchend("foobar", "bar")

echo myvar
```
outputs:
```
6
```

Because the last character of "bar" is found at position 6 of "foobar".

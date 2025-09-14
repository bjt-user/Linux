## examples

#### escape dots

```
vim9script

const myconst = escape("foo.bar", ".")

echo myconst
echo strlen(myconst)
echo strlen("foo.bar")
```
will output:
```
foo\.bar
8
7
```

So it adds an additional backspace char and this increases the string length.

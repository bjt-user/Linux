## general info

```
matchend({expr}, {pat} [, {start} [, {count}]])                 matchend()
                Same as match(), but return the index of first character
                after the match.  Example:
                        :echo matchend("testing", "ing")
                results in "7".
```

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

#### with start

```
vim9script

var myvar = matchend("foobar", "bar", 3)

echo myvar
```
outputs
```
6
```

But this
```
vim9script

var myvar = matchend("foobar", "bar", 4)

echo myvar
```
outputs:
```
-1
```

Because it starts at position 4 of "foobar".\
So it looks in "ar" for "bar" and does not find the match.

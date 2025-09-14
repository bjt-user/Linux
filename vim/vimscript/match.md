## examples

#### substring

```
vim9script

var myvar = match("foobar", "bar")

echo myvar
```
outputs:
```
3
```
because the substring "bar" starts at position 3.

## troubleshooting

#### double quotes vs. single quotes

When matching whitespace this will work:
```
vim9script

echo match('foo bar', '\s')
```

But if you use double quotes, you need to escape the backslash:
```
echo match('foo bar', "\\s")
```

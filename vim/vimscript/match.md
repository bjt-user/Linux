## general info

`:h match()`

```
match({expr}, {pat} [, {start} [, {count}]])                    match()
When {expr} is a List then this returns the index of the
first item where {pat} matches.  Each item is used as a
String, Lists and Dictionaries are used as echoed.

Otherwise, {expr} is used as a String.  The result is a
Number, which gives the index (byte offset) in {expr} where
{pat} matches.

A match at the first character or List item returns zero.
If there is no match -1 is returned.

For getting submatches see matchlist().
```

```
If {start} is given, the search starts from byte index
{start} in a String or item {start} in a List.
The result, however, is still the index counted from the
first character/item.
```

Return value:\
> If there is no match -1 is returned.


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

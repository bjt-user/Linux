## general info

```
split({expr} [, {pat} [, {keepempty}]])
        List    make List from {pat} separated {expr}
```

`:h split()`

```
split({string} [, {pattern} [, {keepempty}]])                   split()
            Make a List out of {string}.  When {pattern} is omitted or
            empty each white space separated sequence of characters
            becomes an item.
            Otherwise the string is split where {pattern} matches,
            removing the matched characters. 'ignorecase' is not used
            here, add \c to ignore case. /\c
            When the first or last item is empty it is omitted, unless the
            {keepempty} argument is given and it's non-zero.
            Other empty items are kept when {pattern} matches at least one
            character or when {keepempty} is non-zero.
            Example:
                    :let words = split(getline('.'), '\W\+')
            To split a string in individual characters:
                    :for c in split(mystring, '\zs')
            If you want to keep the separator you can also use '\zs' at
            the end of the pattern:
                    :echo split('abc:def:ghi', ':\zs')
                    ['abc:', 'def:', 'ghi']
            Splitting a table where the first element can be empty:
                    :let items = split(line, ':', 1)
            The opposite function is join().
```

## examples

#### split by whitespace

```
vim9script

var my_line = "this is just foo.morefoo.bar"

echo split(my_line)
```
outputs:
```
['this', 'is', 'just', 'foo.morefoo.bar']
```

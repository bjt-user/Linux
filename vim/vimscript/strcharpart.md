## general info

`:h strcharpart()`

```
strcharpart({src}, {start} [, {len} [, {skipcc}]])              strcharpart()
        Like strpart() but using character index and length instead
        of byte index and length.
        When {skipcc} is omitted or zero, composing characters are
        counted separately.
        When {skipcc} set to 1, composing characters are treated as a
        part of the preceding base character, similar to slice().
        When a character index is used where a character does not
        exist it is omitted and counted as one character.  For
        example:
                strcharpart('abc', -1, 2)
        results in 'a'.

        Returns an empty string on error.

        Can also be used as a method:
                GetText()->strcharpart(5)

        Return type: String
```

## examples

#### get substring by start index and length

```
vim9script

echo strcharpart("This is a line.", 5, 9)
```
outputs
```
is a line
```

It starts at index 5 `i` and then reads in 9 chars.

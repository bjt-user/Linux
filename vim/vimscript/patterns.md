## general info

```
:h pattern
```

```
:h pattern-overview
```

#### branches

> A pattern is one or more branches, separated by `\|`.

## examples

#### single character

```
syn match Error ","
```

#### literal dots at the beginning of a line

```
syn match Error "^\."
```

#### exactly three occurrences

Match exactly three `a`s:
```
syn match Error "a\{3}"
```

#### three or more occurrences

Match three or more `a`s:
```
syn match Error "a\{3,}"
```

#### whitespace

This will match the strings "one" and "two" with zero or more spaces/tabs \
in between.\
`\s` will NOT match newlines.
```
syn match Error "one\s*two"
```

So this will match "onetwo", "one two", or "one     two".

#### non uppercase

This will match three or more non uppercase characters.\
It will also match numbers.
```
syn match Error "[^A-Z]\{3,}"
```

#### non uppercase and non number character class

This will match three or more lower case characters and whitespace, \
but not numbers or upper case characters:
```
syn match Error "[^A-Z0-9]\{3,}"
```

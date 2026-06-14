## general info

```
:h pattern
```

```
:h pattern-overview
```

#### branches

> A pattern is one or more branches, separated by `\|`.

#### atoms

```
:h atom
```

> An atom can be one of a long list of items.\
Many atoms match one character in the text.\
It is often an ordinary character or a character class.\
Parentheses can be used to make a pattern into an atom.

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

#### lower case characters and whitespace in one character class

This will match 3 or more lowercase characters and/or spaces or tabs.
```
syn match Error "[a-z[:space:]]\{3,}"
```

`\s` will NOT work.

#### @ symbol stuff

This will highlight any "bar" that is not in "foobar":
```
syn match Error "\(foo\)\@<!bar"
```

## general info

```
:h pattern
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

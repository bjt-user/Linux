## general info

```
:h line-continuation
```

> In Vim9 script the backslash can often be omitted, but not always.

```
:h vim9-line-continuation
```

#### newline then backslash and space

```
syn keyword words
	\ foo
```

#### failed attempts

This will NOT work:
```
syn keyword words \
	foo
```

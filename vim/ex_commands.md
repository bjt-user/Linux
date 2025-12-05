## general info

https://vimhelp.org/index.txt.html#ex-cmd-index

```
:h ex-cmd-index
```

## specific commands

#### find

```
:find <string>
```

> find file in 'path' and edit it

By default path is this:
```
path=.,/usr/include,,
```

You may use wildcards, but if you get more than one hit you get:
```
E77: Too many file names
```

Example:
```
:find stdlib.h
```

#### vimgrep

Search for the string `cmp` in .c files:
```
:vimgrep cmp *.c
```

Advance to the next match with `:cn`.

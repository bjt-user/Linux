## general info

```
:h quickfix
```

```
:h make
```

There is a
```
:make
```
ex command.

You can pass additional arguments like so:
```
:make clean
```

```
:make -j8
```

After the compilation you can use
```
:cn
```
to jump to the next warning/error.

#### errorformat

```
:h errorformat
```

Very difficult syntax.

A space has to be escaped by a backslash.\
And double quotes seem to be not allowed around the string.

For `sh` filetype this works:
```
set makeprg=shellcheck\ -f\ gcc\ %
set efm=%f:%l:%c:\ %trror:\ %m\ [SC%n],%f:%l:%c:\ %tarning:\ %m\ [SC%n],%f:%l:%c:\ %tote:\ %m\ [SC%n],%-G%.%#
```

This was already in `/usr/share/vim/vim91/compiler/shellcheck.vim` but without the `%` \
at the end of the `makeprg`.

`%tarning` seems to check the first character of `warning` which is `w`.\
The `arning` is just the literal string and not part of the "item".

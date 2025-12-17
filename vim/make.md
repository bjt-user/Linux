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

A space has to be escaped by a backslash.

For `sh` filetype this works:
```
set makeprg=shellcheck\ -f\ gcc\ %
set efm=%f:%l:%c:\ %trror:\ %m\ [SC%n],%f:%l:%c:\ %tarning:\ %m\ [SC%n],%f:%l:%c:\ %tote:\ %m\ [SC%n],%-G%.%#
```

This was already in `/usr/share/vim/vim91/compiler/shellcheck.vim` but without the `%` \
at the end of the `makeprg`.

The `%trror` and `%tarning` does not really make sense according to the docs \
and is generelly a weird syntax.

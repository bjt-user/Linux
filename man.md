## general info

The source code of the `man` program seems to live here:\
https://gitlab.com/man-db/man-db

#### archlinux

The `man` command comes with the package `man-db`:
```
core/man-db 2.11.2-1 [installed: 2.13.1-1]
    usr/bin/man
```

## usage

#### open gzipped man page directly

```
man /usr/share/man/man3/assert.3.gz
```

## syntax

```
man 7 man
```

#### .IP (indented paragraph)

```
.IP [tag] [indentation]
  Set an indented paragraph with an optional tag.\
  The tag and indentation arguments, if present, are handled as with .TP, with the\
  exception that the tag argument to .IP cannot include a macro call.
```

> The indented paragraph (`.IP`) macro is useful to continue the indented \
content of a narrative started with `.TP`, or to present an itemized or ordered list.

#### .sp

Seems to be a line break.

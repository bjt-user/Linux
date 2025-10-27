## general info

```
:h tags
```

## usage

#### add custom tags file

Put this in your filetype file:
```
set tags=tags;/
set tags+=/tmp/tags
```
(You should always extend the tags option with `+=` instead of overwriting.)

And under `/tmp` create a C file with a custom function.

Then do
```
ctags /tmp/foo.c
```
to create the tags file `/tmp/tags`.

Then you can autocomplete the name of that function and jump into its \
definition from inside every C file.

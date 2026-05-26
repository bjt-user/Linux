## general info

```
:h tags
```

## usage

#### jump to a tag from the cli

Jump to the **first matching** tag `my_function` in your `tags` file:
```
vim -t my_function
```

For example if you have prototypes and function definitions in your `tags` \
file, then you have two tags with the same name.\
`vim` will use the **first** tag it finds in the `tags` file.

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

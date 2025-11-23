#### alphabetically sort lines

This will sort lines 1 to 10:
```
:1,10:sort
```

Sort the entire file:
```
:%:sort
```

You can also just select lines in visual mode.

#### using it for #includes

In combination with `:uniq` this is probably great for include/import sections \
at the beginning of source files.

## usage

#### NOT WORKING: overlapping groups

If you have a region where `start=` and `end=` are the same.\
And the end of a section is the start of a new section, \
it will NOT work:
```
syn region section matchgroup=outter_section start="^#\{1,6}" end="^#\{1,6}"
```

## examples

#### multiline comment

This will highlight the entire comment inclusing the `/*` and `*/` chars red:
```
syn region ml_comment start="\/\*" end="\*\/"

hi def link ml_comment Error
```

If you use `matchgroup` only what is inside the `/*` and `*/` chars will be \
highlighted red:
```
syn region ml_comment matchgroup=subgroup start="\/\*" end="\*\/"
```

You seem to define a new syntax group.

And you can highlight the "outter" part of the region differently when you \
highlight this group:
```
hi def link subgroup Statement
```

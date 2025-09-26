## general info

#### sources

`:h usr_28.txt`

https://www.vimfromscratch.com/articles/vim-folding

#### behavior

If there is only one line that would be folded it will not be folded.

`:h 28.3`:
> You can yank, delete and put folds as if it was a single line.\
This is very useful if you want to reorder functions in a program.

> Folds are opened automatically when jumping around or moving the cursor left
or right.\
For example, the "0" command opens the fold under the cursor
(if 'foldopen' contains "hor", which is the default).

## usage

### folding bindings

`za` toggle the folding under cursor \
`zo` open the folding under cursor \
`zc` close the folding under cursor \
`zM` to close all folds \
`zR` to open all folds \

`zm` reduce folding level by one (fold more) \
`zr` increment folding level by one (reduce folding)

### foldmethods

### foldcolumn

```
'foldcolumn' 'fdc'
'foldcolumn' 'fdc'      number (default 0)
                        local to window
                        {not available when compiled without the +folding
                        feature}
When non-zero, a column with the specified width is shown at the side
of the window which indicates open and closed folds.
The maximum value is 12.
See folding.
```

`:h fold-foldcolumn`:
```
An open fold is indicated with a column that has a '-' at the top and '|'
characters below it.  This column stops where the open fold stops.  When folds
nest, the nested fold is one character right of the fold it's contained in.

A closed fold is indicated with a '+'.

These characters can be changed with the 'fillchars' option.

Where the fold column is too narrow to display all nested folds, digits are
shown to indicate the nesting level.
```

### foldlevel

see current foldlevel:
```
set foldlevel?
```

### foldnestmax

`:h foldnestmax`

```
'foldnestmax' 'fdn'
'foldnestmax' 'fdn'     number (default: 20)
                        local to window
                        {not available when compiled without the +folding
                        feature}
Sets the maximum nesting of folds for the "indent" and "syntax" methods.
This avoids that too many folds will be created.
Using more than 20 doesn't work, because the internal limit is 20.
```

### foldignore

Show the foldignore char:
```
set foldignore?
```

`:h foldignore`:
```
foldignore' 'fdi'
'foldignore' 'fdi'      string (default: "#")
                        local to window
                        {not available when compiled without the +folding
                        feature}
Used only when 'foldmethod' is "indent".
Lines starting with characters in 'foldignore' will get their fold level from surrounding
lines.
White space is skipped before checking for this character.
The default "#" works well for C programs.  See fold-indent.
```

## foldmethod manual

If `set foldmethod?` is manual you can make parts of the buffer foldable.

Select lines with `V` and hit `zf`.

Now you can open that fold with `zo` and close it with `zc`.

## foldmethod indent

```
set foldmethod=indent
```

Use `zM` to close all folds and `zR` to open all folds.

For go files it did not fold some main functions...

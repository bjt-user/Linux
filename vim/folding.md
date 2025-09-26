## sources

https://www.vimfromscratch.com/articles/vim-folding

## folding bindings

`za` toggle the folding under cursor \
`zo` open the folding under cursor \
`zc` close the folding under cursor \
`zM` to close all folds \
`zR` to open all folds \

`zm` reduce folding level by one (fold more) \
`zr` increment folding level by one (reduce folding)

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

## foldcolumn

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

## sources

https://www.vimfromscratch.com/articles/vim-folding

## folding bindings

`za` toggle the folding under cursor \
`zo` open the folding under cursor \
`zc` close the folding under cursor \
`zM` to close all folds \
`zR` to open all folds

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

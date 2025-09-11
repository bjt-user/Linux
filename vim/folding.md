## sources

https://www.vimfromscratch.com/articles/vim-folding

## foldmethod manual

If `set foldmethod?` is manual you can make parts of the buffer foldable.

Select lines with `V` and hit `zf`.

Now you can open that fold with `zo` and close it with `zc`.

## foldmethod indent

```
set foldmethod=indent
```

Use `zM` to close all folds and `zR` to open all folds.

This seems to work good for go files.

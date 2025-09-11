## general info

```
:help ftdetect
```

## usage

#### create custom file type

Create a custom file type that is detected through file extension.

```
mkdir -pv ~/.vim/ftdetect/foo.vim
```

With this content:
```
au BufRead,BufNewFile *.foo set filetype=foo
```

When you now open a file with a `.foo` extension it will show the `foo` filetype.

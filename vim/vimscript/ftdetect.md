## general info

```
:help filetypes
```

```
:help ftdetect
```

#### predefined filetypes

They are defined in `$VIMRUNTIME/filetype.vim`.

For example `/usr/share/vim/vim91/filetype.vim`.

Don't edit this file as it will be overwritten by updates.

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

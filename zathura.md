## general info

https://wiki.archlinux.org/title/Zathura

#### installation

```
sudo pacman -S zathura
```
But you also need to install a plugin to read pdfs.

```
sudo pacman -S zathura-pdf-mupdf
```

## configuration

Touch the file `${PATH}/.config/zathura/zathurarc`.

#### copy to clipboard

Put this line in the config file:
```
set selection-clipboard clipboard
```

## usage

```
zathura debugging_with_gdb.pdf
```
<kbd>j/k</kbd> to scroll\
<kbd>J/K</kbd> next page/previous page\
<kbd>+/-</kbd> zoom in/out

`:500` - go to page 500\
`:bmark mystring` - set a bookmark for the current page with the label `mystring`\
`:blist` - list all bookmarks\
`:bdelete mystring` - delete bookmar named `mystring`

## general info

```
:help highlight
```

#### location of syntax files

Put them in `~/.vim/syntax`.

If you put them in `~/.vim/after/syntax` you need to use
```
highlight clear
```
for some reason to make it work.

#### best practice

> It is usually a good practice not to define exact colors in a syntax files \
unless it is for your own use only.

> Usual approach is to link syntax definitions to existing highlight groups,\
:h group-name should give you an idea what is available.

> Having your syntax definitions linked to the existing highlight group names \
would make it work with different colorschemes (dark/light/whatever).

## usage

#### highlight clear

If you put your syntax files in `~/.vim/after/syntax` you need
```
highlight clear
```
in your vimscripts for syntax highlighting to take effect.

#### show active "highlight groups" in the active buffer

```
:hi
```

#### show a specific highlight group

```
:hi Todo
Todo           xxx term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
```

#### syntax match

This will hightlight all lines that start with a pound sign:
```
syntax match heading "^#.*"

highlight heading ctermfg=10 cterm=bold
```

## examples

#### keywords

This will highlight the words "foo" and "bar":
```
highlight clear

syntax keyword foo_words foo bar

highlight foo_words ctermfg=12 cterm=italic
```

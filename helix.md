## general info

#### migrating from vim

https://docs.helix-editor.com/from-vim.html

https://github.com/helix-editor/helix/wiki/Migrating-from-Vim

#### tutorial

https://github.com/helix-editor/helix/wiki/1.-Tutorial:-Getting-Started

```
helix --tutor
```

## usage

#### delete a character

It is not `x` as in `vim`, it is `d`.

#### delete a line

`xd`

Then you can past it with `p`.

#### visual mode

It is `v` instead of `V`.

#### go to start of the line

`gh`

#### shell commands

```
:sh ls -la
```

## lsp features

#### show documentation for item under cursor

`<space>` + `k`

#### rename symbol

This will rename all occurrences of the symbol.

`<space>` + `r`

## ex commands

#### write and exit buffer

`:wbc`

## navigation

Try to use `gw` and then type a two character label.

## issues

How to the next word without dragging a selction behind?\
https://github.com/helix-editor/helix/discussions/6976

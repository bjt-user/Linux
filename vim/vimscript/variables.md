## general info

#### documentation

```
:h var
```

## declaring vars

#### declare local variable

```
vim9script

var foo = "bar"
```

#### declare local constant

```
vim9script

const bar = "foobar"
```

#### declare global variable

This works for legacy vimscript:
```
let g:my_var = 0
```
or
```
const g:my_var = 0
```

For vim9script this works:
```
const g:my_var = "foo"
```
or
```
g:my_var = "foo"
```

The `var` keyword will not work in `vim9script`.

## print variables in scope

#### print all globals vars

```
echo g:
```

#### print all local vars

```
echo b:
```

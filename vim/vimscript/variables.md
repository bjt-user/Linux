## general info

#### documentation

```
:h var
```

## types

#### get type of a variable

```
var flevelmin = 0
echo typename(flevelmin)
```
will output
```
number
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

#### predefined values

```
:h E1034
```

```
In Vim9 script one can use the following predefined values:
    true
    false
    null
    null_blob
    null_channel
    null_class
    null_dict
    null_function
    null_job
    null_list
    null_tuple
    null_object
    null_partial
    null_string
```

So you can initialize a job like this:
```
var my_job = null_job
```

## print variables in scope

#### print all globals vars

```
echo g:
```

#### print all local vars

```
echo b:
```

## predefined vim variables

```
:h :v
```

```
v:lnum lnum-variable
v:lnum

Line number for the 'foldexpr' fold-expr, 'formatexpr' and
'indentexpr' expressions, tab page number for 'guitablabel'
and 'guitabtooltip'.
Only valid while one of these expressions is being evaluated.
Read-only when in the sandbox.
```

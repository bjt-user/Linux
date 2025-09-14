## examples

#### get line 3
```
vim9script

var myvar = getline(3)

echo myvar
```
will output:
```
var myvar = getline(3)
```

#### get line at cursor position

```
vim9script

var myvar = getline(".")

echo myvar
```
The output depends on the cursor position.\
It will output the line at cursor position.

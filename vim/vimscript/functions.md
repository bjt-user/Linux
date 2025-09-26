## general info

`:h def`

https://vimhelp.org/map.txt.html#script-local

> When defining a function in a script, "s:" can be prepended to the name to
make it local to the script (in vim9script functions without a prefix are
local to the script).

## scope

In `vim9script` functions seem to be local to the script.\
You need to make them global so you can access them from outside:
```
def g:GetStrAtCursor()
```

## examples

#### return a number

```
vim9script

def Three(): number
	return 3
enddef

echo Three()
```
outputs:
```
3
```

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

## usage

#### calling a function

This works:
```
vim9script

def EchoFoo()
        echo "foo"
enddef

EchoFoo()
```

But you can also use the `call` keyword:
```
call EchoFoo()
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

#### add three function

Takes a number as an argument and returns a number.

```
vim9script

def AddThree(my_num: number): number
        return my_num + 3
enddef

echo AddThree(10)
```
ouputs:
```
13
```

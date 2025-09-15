#### echoerr

Might be helpful for "printf debugging".

```
echoerr "foobar"
```

It also outputs the line number and the function the error occured in.

#### external echo

You can pass variables to external commands.\
For example to echo like this:
```
vim9script

var myvar = "foo"

execute "!" .. "echo " .. "'myvar:>" .. myvar .. "<'"
```

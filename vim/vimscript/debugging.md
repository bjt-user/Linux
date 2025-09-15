#### echoerr

Might be helpful for "printf debugging".

But it is probably better to join at least two `echoerr` commands together \
because then it does not get overwritten by subsequent echoes and you \
have to "acknoledge" it by pressing enter.

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

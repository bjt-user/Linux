## general info

There is a difference between bytes and chars in vimscript.

Unicode characters may not always fit into a byte.

## examples

#### get first char of string

```
vim9script

const my_string = "foobar"

echo nr2char(strgetchar(my_string, 0))
```

## general info

`:h tempname`

> The result is a String, which is the name of a file that doesn't exist.\
It can be used for a temporary file.\
The name is different for at least 26 consecutive calls.

## example

```
vim9script

var myfile = tempname()

echo myfile
```
prints something like `/tmp/vrpUdPT/0`

`call_shell` seems to write the output of a `:system` command to a temporary file.

For example to `/tmp/vieSPh7/2`.

Because of this redirect to a file colored output will sometimes be removed.\
For example `bat` will not display colors, when redirected to a file:
```
bat /etc/os-release > /tmp/foobar.txt
```

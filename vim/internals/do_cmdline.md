## general info

Function in `ex_docmd.c`.

It gets called when you hit `:` in normal mode.

It calls `do_one_cmd` with the variable `cmdline_copy`.\
And in `cmdline_copy` is the command as a string.

#### cmdline_copy

It gets assigned a string value in this line:
```
968		cmdline_copy = next_cmdline;
```

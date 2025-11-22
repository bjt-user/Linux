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

#### next_cmdline

Seems to get assigned here:
```
925             if (fgetline == NULL || (next_cmdline = fgetline(':', cookie,
```

#### function pointer "fgetline"

When hitting a `:` there is the function `getexline` from `ex_getln.c` behind \
the function pointer:
```
(gdb) p fgetline
$1 = (char_u *(*)(int, void *, int,
    getline_opt_T)) 0x561cd542d70a <getexline>
```

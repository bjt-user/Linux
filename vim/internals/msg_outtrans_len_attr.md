#### call from gdb

This prints "foobar" under the statusbar after continuing:
```
(gdb) call msg_outtrans_len_attr("foobar", 6, 0)
$1 = 6
(gdb) c
Continuing.
```

To clear the statusbar again:
```
call msg_clr_eos
```

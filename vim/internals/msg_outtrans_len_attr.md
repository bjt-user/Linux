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

#### why do you need "continue"?

What is the `main_loop` or another function further up in the call stack doing?

And after which function call is the message printed to the screen?

#### NOT POSSIBLE: debug after call from gdb

execute this command in `gdb` and hit `n` until something is printed to the screen:
```
(gdb) call msg_outtrans_len_attr("foobar", 6, 0)
```

```
(gdb) n
Cannot find bounds of current function
```

What is that?

Because the function was called from gdb there seem to be problems for gdb \
knowing where the current line is and so on...

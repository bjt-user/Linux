#### about

`out_buf` is a global var.\
It is written to the screen with `out_flush()`.\
It contains everything that will be put on the screen or already is on \
the screen.

It is not that simple.

This will NOT change the current buffer:
```
(gdb) set out_buf = "Is this vim?"
(gdb) call out_flush()
```

#### startup

When you startup vim `out_buf` is not empty.\
It contains everything that you can see on the screen.\
The status bar, the content of the buffer, and some ansi escape codes.

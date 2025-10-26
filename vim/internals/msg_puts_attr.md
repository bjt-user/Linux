#### general info

This is a normal output to the statusline:
```
call msg_puts_attr("this is msg_puts_attr", 0)
```

When the second argument is 1 the string will be with white background and \
black text.

When the second argument is a 2 the string will be bold.

3 is white background and bold black foreground.

4 is italic.

5 is white background and italic black foreground.

6 is italic bold foreground.

10 is underscore bold.

#### out_flush()

Sometimes you need to call `out_flush()` afterwards.\
No idea why.

#### screenattr()

Maybe the number that `:echo screenattr([row], [col])` returns can be used?

According to this function `2127` should be yellow foreground.

No! This is white foreground:
```
(gdb) call msg_puts_attr("this is msg_puts_attr", 2127)
(gdb) call out_flush()
```

As `:h screenattr` says - its return value is an "arbitrary" number.

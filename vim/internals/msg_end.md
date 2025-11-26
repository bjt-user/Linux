## general info

```
/*
 * end putting a message on the screen
 * call wait_return() if the message does not fit in the available space
 * return TRUE if wait_return() not called.
 */
    int
msg_end(void)
```

`msg_end()` had cleared everything under the status bar.\
Which was not desirable.

Does it always behave like this?\
=> No, it does not always do that...

It is the call of `out_flush();` inside `msg_end()` that clears the message \
screen.

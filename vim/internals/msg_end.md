## general info

```
/*
 * end putting a message on the screen
 * call wait_return() if the message does not fit in the available space
 * return TRUE if wait_return() not called.
 */
    int
msg_end(void)
{
    /*
     * If the string is larger than the window,
     * or the ruler option is set and we run into it,
     * we have to redraw the window.
     * Do not do this if we are abandoning the file or editing the command line.
     */
    if (!exiting && need_wait_return && !(State & MODE_CMDLINE))
    {
        wait_return(FALSE);
        return FALSE;
    }
    out_flush();
    return TRUE;
}
```

`msg_end()` had cleared everything under the status bar.\
Which was not desirable.

Does it always behave like this?\
=> No, it does not always do that...

It is the call of `out_flush();` inside `msg_end()` that clears the message \
screen.

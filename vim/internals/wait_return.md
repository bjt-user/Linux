## general info

Function in `message.c`.

```
/*
 * Wait for the user to hit a key (normally Enter).
 * If "redraw" is TRUE, clear and redraw the screen.
 * If "redraw" is FALSE, just redraw the screen.
 * If "redraw" is -1, don't redraw at all.
 */
    void
wait_return(int redraw)
```

## behavior

Prints the message "Press ENTER or type command to continue" to the cmdline.

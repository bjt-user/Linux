## general info

Function in `message.c`.

```
/*
 * If the written message runs into the shown command or ruler, we have to
 * wait for hit-return and redraw the window later.
 */
    void
msg_check(void)
{
    if (msg_row == Rows - 1 && msg_col >= sc_col
#ifdef HAS_MESSAGE_WINDOW
                && !in_echowindow
#endif
            )
    {
        need_wait_return = TRUE;
        redraw_cmdline = TRUE;
    }
}
```

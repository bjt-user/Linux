## general info

Function in `message.c`.

```
/*
* Clear from current message position to end of screen.
* Skip this when ":silent" was used, no need to clear for redirection.
*/
void
msg_clr_eos(void)
{
    if (msg_silent == 0)
        msg_clr_eos_force();
}
```

#### call graph

msg_clr_eos -> msg_clr_eos_force

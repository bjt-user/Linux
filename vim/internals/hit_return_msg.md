## general info

Function in `message.c`.

```
 * Write the hit-return prompt.
 */
    static void
hit_return_msg(void)
```

## TODO: assumptions

Seems to always print this message:
```
msg_puts_attr(_("Press ENTER or type command to continue"), HL_ATTR(HLF_R));
```

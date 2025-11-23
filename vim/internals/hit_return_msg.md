## general info

Function in `message.c`.

```
 * Write the hit-return prompt.
 */
    static void
hit_return_msg(void)
```

## assumptions

Seems to always print this message:
```
msg_puts_attr(_("Press ENTER or type command to continue"), HL_ATTR(HLF_R));
```

## called by

```
Functions calling this function: hit_return_msg

  File      Function       Line
0 message.c wait_return    1310 hit_return_msg();
1 message.c wait_return    1383 hit_return_msg();
2 message.c repeat_message 3774 hit_return_msg();
```

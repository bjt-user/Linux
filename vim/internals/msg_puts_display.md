## general info

Function in `message.c`.

```
/*
 * The display part of msg_puts_attr_len().
 * May be called recursively to display scroll-back text.
 */
    static void
msg_puts_display(
    char_u      *str,
    int         maxlen,
    int         attr,
    int         recurse)
```

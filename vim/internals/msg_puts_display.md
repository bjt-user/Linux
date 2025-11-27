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

#### msg_col

After this call `msg_col` was set to 77:
```
2522			    t_puts(&t_col, t_s, s, attr);
```

And after this call it was set to 0 again:
```
2553			    s = screen_puts_mbyte(s, l, attr);
```

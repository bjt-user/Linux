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

#### msg_row

`msg_row` was incremented by 1 after this line:
```
2536		    if (msg_col >= cmdline_width)
```

#### iteration over string

This line iterate over the string `s`:
```
2484        while ((maxlen < 0 || (int)(s - str) < maxlen) && *s != NUL)
```
The char pointer is incremented by one in this line:
```
2719            ++s;
```

## general info

`msg_col` is a global variable that seems to show the column cursor position \
in the message "section".

## when does it update

The value seems to change after a call to `msg_puts_attr_len`.\
And in that function the value changes after the call to `msg_puts_display`.\
And in that function the value changes after the call to `t_puts`.\
And in that function the value is changed like this:
```
msg_col += *t_col;
```

This call changes the value in `msg_puts_attr_len`:
```
2362            msg_puts_display((char_u *)str, maxlen, attr, FALSE);
```

## general info

in `charset.c`:
```
char_u * transchar_buf(buf_T *buf, int c)
```

Might convert ansi escape sequences into something else?

Looks more like it converts wide unicode chars to something else.

Also not that useful as a breakpoint because this function is almost \
always active.

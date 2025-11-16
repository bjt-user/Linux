## general info

Function in `charset.c`.

```
/*
 * Convert non-printable character to two or more printable characters in
 * "charbuf[]".  "charbuf" needs to be able to hold five bytes.
 * Does NOT work for multi-byte characters, c must be <= 255.
 */
    void 
transchar_nonprint(buf_T *buf, char_u *charbuf, int c)
```

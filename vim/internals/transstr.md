## general info

Function in `charset.c`.

```
 * Translate a string into allocated memory, replacing special chars with
 * printable chars.  Returns NULL when out of memory.
 */
    char_u *
transstr(char_u *s)
```

## how it transforms strings

Execute it in ex command or function command to see how it \
transforms the string.

"foobar" -> "foobar" \
"foo\nbar\n" -> "foo^@bar^@" \
"\e[31mred\e[0m" -> "^[[31mred^[[0m" \
"\x1b[31mred\x1b[0m" -> "^[[31mred^[[0m"

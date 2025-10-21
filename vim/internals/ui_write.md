#### general info

Defined in `ui.c`:
```
void ui_write(char_u *s, int len, int console UNUSED)
```
It prints characters to the screen.\
After the cursor position, like when doing an insert.

#### write string to the screen

This write the string `foo` after the cursor position:
```
call ui_write("foo", 3, 0)
```

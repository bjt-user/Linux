## general info

There are 4 version of `mch_write` - one for every OS.\
One for Amiga, one for Windows, one for Mac and one for Unix.

Definition in `os_unix.c`:
```
void mch_write(char_u *s, int len)
```

It is doing a `write` system call:
```
vim_ignored = (int)write(1, (char *)s, len);
```
Argument one is the file descriptor (`1` means stdout).

So it just writes the string to stdout.

It seems to be called everytime a character is written to the screen.\
Or when changing to insert mode or when hitting the colon.\
So probably everytime the screen changes in any way.\
Usually with `out_buf` as argument.

## call graph

out_flush -> ui_write(out_buf) -> mch_write -> write (syscall)

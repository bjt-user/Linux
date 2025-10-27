## general info

There are 4 version of `mch_write` for every OS.\
One for Amiga, one for Windows, one for Mac and one for Unix.

It is doing a `write` system call:
```
vim_ignored = (int)write(1, (char *)s, len);
```

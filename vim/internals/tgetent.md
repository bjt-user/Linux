`tgetent` is from `ncurses` lib.

It seems to be called only once at program startup.

It is called by `invoke_tgetent` from `term.c`.

This is the call stack: (backtrace)
```
#0  0x00007ffff7c90bf0 in tgetent () from /usr/lib/libncursesw.so.6
#1  0x0000555555805dd9 in invoke_tgetent (tbuf=0x7fffffffd330 "xg\235UUU", term=0x5555559dc470 "xterm-256color") at term.c:2425
#2  0x0000555555805701 in set_termname (term=0x5555559dc470 "xterm-256color") at term.c:2050
#3  0x00005555558063b9 in termcapinit (name=0x0) at term.c:2750
#4  0x00005555558ef707 in main (argc=1, argv=0x7fffffffdcd8) at main.c:382
```

#### invoke_tgetent

```
/*
2415  * Call tgetent()
2416  * Return error message if it fails, NULL if it's OK.
2417  */
2418     static char *
2419 invoke_tgetent(char_u *tbuf, char_u *term)
```

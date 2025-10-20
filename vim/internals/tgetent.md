#### general info

`tgetent` is from `ncurses` lib.

`man tgetent`:
> Initialization \
   tgetent  loads  the terminal database entry for name; see term(7).\
   This must be done before calling any of the other functions.\
   It returns:
      1    on success,
      0    if there is no such entry\
      (or if the matching entry describes a generic terminal, having too little information for  curses  ap‐
           plications to run), and
      -1   if the terminfo database could not be found.

> Global Variables
   The variables PC, UP and BC are set by tgetent to the terminfo entry's data for pad_char,\
   cursor_up  and  backspace_if_not_bs,  respectively.
   UP  is  not  used  by ncurses.  PC is used by delay_output(3X).
   BC is used by tgoto emulation.  The variable ospeed is set by
   ncurses using a system-specific encoding to indicate the terminal's data rate.

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

It calls `TGETENT`, but that is just a macro for `tgetent`.\
So it directly calls `tgetent`.
```
# define TGETENT(b, t)  tgetent((char *)(b), (char *)(t))
```
It calls `tgetent` with these two char pointers:
```
2425        i = TGETENT(tbuf, term);
(gdb) p tbuf
$1 = (char_u *) 0x7fffffffd330 "xg\235UUU"
(gdb) p term
$2 = (char_u *) 0x5555559dc470 "xterm-256color"
```
What is `tbuf` exactly?

It seems like `tbuf` is used uninitialized.

What happens if I initialize it with `memset` and null terminators.\
=> scheint keine Probleme zu machen

What is the value of `tbuf` after the function exits?\
=> still empty

ncurses ignores the buffer pointer bp, as do other termcap implementations conforming to portions of X/Open Curses now withdrawn.
              The  BSD  termcap  library  would store a copy of the terminal type description in the area referenced by this pointer.  terminfo
              stores terminal type descriptions in compiled form, which is not the same thing.

## general info

Function in `nnn.c`.

```
3557 /*
3558  * Returns SEL_* if key is bound and 0 otherwise.
3559  * Also modifies the run and env pointers (used on SEL_{RUN,RUNARG}).
3560  * The next keyboard input can be simulated by presel.
3561  */
3562 static int nextsel(int presel)
```

#### startup tui

This line seems to start up the tui:
```
3570         i = get_wch(&c);
```

`get_wch` is in `curses.h`.

```
extern NCURSES_EXPORT(int) get_wch (wint_t *);
```

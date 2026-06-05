## general info

Function in `nnn.c`.

Seems to set colors and not to startup the ncurses tui.

But it **hides the cursor**.

#### called by

Function `main()` in line 10719 and 10721.

## hacking

#### visible cursor

After making this change:
```
2438     //curs_set(FALSE); /* Hide cursor */
2439     curs_set(TRUE); /* Hide cursor */
```
The cursor stays visible.

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
"\x1b[31mred\x1b[0m" -> "^[[31mred^[[0m" \
"\033[31mred\033[0m" -> "^[[31mred^[[0m"

## when it gets called

Seems to get called very rarely.\
Doesn't get called when doing `:echo` commands.

```
Functions calling this function: transstr

  File        Function                     Line
0 buffer.c    maketitle                    4093 ((p = transstr(gettail(curbuf->b_fname))) != NULL)
1 buffer.c    maketitle                    4187 ((p = transstr(buf + buflen)) != NULL)
2 fold.c      get_foldtext                 2008 p = transstr(text);
3 popupmenu.c pum_process_item              805 st = transstr(s);
4 screen.c    win_redr_custom              1129 p = transstr(buf);
5 strings.c   f_strtrans                   1987 rettv->vval.v_string = transstr(tv_get_string(&argvars[0]));
6 tabpanel.c  screen_puts_len_for_tabpanel  286 temp = transstr(buf);
```

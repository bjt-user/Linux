#### globals.h

```
EXTERN win_T    *curwin;        // currently active window
```
```
EXTERN pos_T    saved_cursor            // w_cursor before formatting text.
```
```
/*
* "State" is the main state of Vim.
* There are other variables that modify the state:
* "Visual_mode"    When State is MODE_NORMAL or MODE_INSERT.
* "finish_op"      When State is MODE_NORMAL, after typing the operator and
*                  before typing the motion command.
* "motion_force"   Last motion_force  from do_pending_operator()
* "debug_mode"     Debug mode.
*/
EXTERN int      State INIT(= MODE_NORMAL);
```

```
#ifdef FEAT_EVAL
EXTERN int      debug_mode INIT(= FALSE);
#endif
```

```
EXTERN int echo_attr INIT(= 0);   // attributes used for ":echo"
```
=> seems to be 0 most of the time

```
EXTERN int      finish_op INIT(= FALSE);// TRUE while an operator is pending
```

```
EXTERN int      motion_force INIT(= 0); // motion force for pending operator
```

```
EXTERN int exmode_active INIT(= 0);     // zero, EXMODE_NORMAL or EXMODE_VIM
```

```
EXTERN char     msg_buf[MSG_BUF_LEN];   // small buffer for messages
```

```
EXTERN int      termcap_active INIT(= FALSE);   // set by starttermcap()
```
This was true in WSL:
```
(gdb) p termcap_active
$16 = 1
```

```
EXTERN char     *xterm_display INIT(= NULL);
```
Was a nil pointer in WSL:
```
(gdb) p xterm_display
$18 = 0x0
```

#### term_is_xterm

```
EXTERN int      term_is_xterm INIT(= FALSE);    // xterm-like 'term'
```
Was true in WSL:
```
(gdb) p term_is_xterm
$19 = 1
```

#### vim_tempdir

Vim seems to create temporary files in this dir:
```
EXTERN char_u   *vim_tempdir INIT(= NULL);
```

When you start up `vim` this is a null pointer.

After executing a `:system` command it is set to:
```
(gdb) p vim_tempdir
$1 = (char_u *) 0x5f70f27fb020 "/tmp/vieSPh7/"
```

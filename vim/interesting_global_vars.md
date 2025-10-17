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

```
EXTERN char     *xterm_display INIT(= NULL);
```

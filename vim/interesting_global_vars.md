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

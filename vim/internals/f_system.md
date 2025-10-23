#### general info

```
/*
* "system()" function
*/
void
f_system(typval_T *argvars, typval_T *rettv)
{
    get_cmd_output_as_rettv(argvars, rettv, FALSE);
}
```

#### call graph

f_system -> get_cmd_output_as_rettv -> get_cmd_output -> call_shell \
-> mch_call_shell (from `os_unix.c`) -> mch_call_shell_fork

#### get_cmd_output

This function seems to return the string of the stdout/stderr output \
after reading from the temporary file.

```
File misc1.c:
2408:   char_u *get_cmd_output(char_u *, char_u *, int, int *);
```

#### mch_call_shell_fork (os_unix.c)

```
static int
mch_call_shell_fork(
char_u      *cmd,
int         options)        // SHELL_*, see vim.h
```
The `options` seem to indicate if the terminal is in cooked or raw mode.\
```
if (options & SHELL_COOKED)
```

In WSL these options are set:
```
(gdb) p options
$1 = 30
(gdb) p/x options
$2 = 0x1e
```

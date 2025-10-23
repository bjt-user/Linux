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

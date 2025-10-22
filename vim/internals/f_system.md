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

f_system -> get_cmd_output_as_rettv -> get_cmd_output -> call_shell

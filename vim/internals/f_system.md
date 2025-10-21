#### general info

```
2689 /*
2690  * "system()" function
2691  */
2692     void
2693 f_system(typval_T *argvars, typval_T *rettv)
2694 {
2695     get_cmd_output_as_rettv(argvars, rettv, FALSE);
2696 }
```

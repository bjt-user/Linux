## general info

Function in `evalfunc.c`.

```
/*
 * "echoraw({expr})" function
 */
    static void
f_echoraw(typval_T *argvars, typval_T *rettv UNUSED)
```

It seems to be this command in vim:
```
:call echoraw("\e[31mred\e[0m")
```
And it can output colors, but it does not clear the rest of the line.

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

#### documentation

`:h echoraw`

```
echoraw({string})                                       echoraw()
        Output {string} as-is, including unprintable characters.
        This can be used to output a terminal code. For example, to
        disable modifyOtherKeys:
                call echoraw(&t_TE)
        and to enable it again:
                call echoraw(&t_TI)
        Use with care, you can mess up the terminal this way.

        Return type: Number
```

#### basic call graph

get_cmd_output_as_rettv -> get_cmd_output

#### output of a system() command

It has the result of a system() command in var `res`.

```
(gdb)
2656            res = get_cmd_output(tv_get_string(&argvars[0]), infile, flags, NULL);
(gdb)
[Detaching after fork from child process 4645]
2673            rettv->vval.v_string = res;
(gdb) p res
$7 = (char_u *) 0x621c36e980d0 "\033[38;5;231mNAME\033[0m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186mArch Linux\033[0m\033[38;5;231m\"\033[0m\n\033[38;5;231mPRETTY_NAME\033[0m\033[38;5;203m=\033[0m\033[38;5;231m\"\033[0m\033[38;5;186mArch Linux\033[0m\033[38;5;231m\"\033[0m\n\033[38;5;"...
```

It does not seem to escape escape characters.

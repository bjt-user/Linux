#### comparing echo and system

`:echo` is an ex command. (`ex_echo` function in `eval.c`)

`:call system` is a function. (`f_system` function in `misc1.c`)

You cannot call `system` like this:
```
:system('sudo dmesg')
```
You would need to use:
```
:echo system('sudo dmesg')
```
or assign to a variable:
```
:let myvar = system('sudo dmesg')
:echo myvar
```

## general info

Is called when ex commands are executed.

## parameters

#### cmdlinep

`cmdlinep` contains the string of the command that will be executed:
```
(gdb) p *cmdlinep
$2 = (char_u *) 0x55d6ffa0e760 "echoraw \"\\e[31mred\\e[0m\""
```
The string here has already escaped special chars.

Break it down:
- the outter double quotes belong to gdb (not part of the string)
- the double quotes are just escaped with a single slash -> that is also normal in gdb
- but the escape sequence should look like this in gdb: `\033[31m` (actually looks like `\\e[31m`)

This
```
:echo "\033[31mred\033[0m"
```
gets converted to:
```
"echo \"\\033[31mred\\033[0m\""
```

And this:
```
:echo "\x1b[31mred\x1b[0m"
```
gets converted to this:
```
(gdb) p *cmdlinep
$4 = (char_u *) 0x558f4f5c5760 "echo \"\\x1b[31mred\\x1b[0m\""
```


What function converts character 27 to two characters?

And that seems to be independend of the ex command:
```
(gdb) p *cmdlinep
$5 = (char_u *) 0x55d6ffa0e760 "echo \"\\e[31mred\\e[0m\""
```
Which makes sense because the ex command is being called later.

#### call graph

do_cmdline -> do_one_cmd -> ex_echo (indirectly through function pointer)

This seems to be the call to the ex command:
```
(cmdnames[ea.cmdidx].cmd_func)(&ea);
```

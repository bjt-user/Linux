## general info

Is called when ex commands are executed.

#### parameters

`cmdlinep` contains the string of the command that was executed:
```
(gdb) p *cmdlinep
$2 = (char_u *) 0x55d6ffa0e760 "echoraw \"\\e[31mred\\e[0m\""
```
The string here has already escaped special chars.

Break it down:
- the outter double quotes belong to gdb (not part of the string)
- the double quotes are just escaped with a single slash -> that is also normal in gdb
- but the escape sequence should look like this in gdb: `\033[31m` (actually looks like `\\e[31m`)

=> The literal backslash has to be converted to `\033` or `\e` (character 27).

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

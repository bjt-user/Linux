## general info

Is called when ex commands are executed.

#### parameters

`cmdlinep` contains the string of the command that was executed:
```
(gdb) p *cmdlinep
$2 = (char_u *) 0x55d6ffa0e760 "echoraw \"\\e[31mred\\e[0m\""
```
The string here has already escaped special chars.

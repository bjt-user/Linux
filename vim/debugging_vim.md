## gdb

#### general approach

1. compile vim with `-g`

2. type `./vim` (the program you compiled) in separate window

3. Attach gdb to the process and use the symbol table from compiled vim:
```
sudo gdb -p {PID} -s ./vim
```

4. execute a function
```
(gdb) call (int)msg("foo")
```
This will print `foo` in the status line of vim.

#### set breakpoint at function and continue

First setup like shown under "general approach".

Then:
```
(gdb) b do_more_prompt
Breakpoint 1 at 0x6397380eb0fd: file message.c, line 3230.
(gdb) c
```
Now the process is detached, you can do something in vim \
and if the function `do_more_prompt` is called the execution \
is stopped again and attached in gdb.\
Then you can debug the function.

## termdebug

```
:packadd termdebug
```

```
:Termdebug vim
```

But no debug symbols found.\
You need to compile with debug flags first.

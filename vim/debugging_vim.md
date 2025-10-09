## gdb

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

## termdebug

```
:packadd termdebug
```

```
:Termdebug vim
```

But no debug symbols found.\
You need to compile with debug flags first.

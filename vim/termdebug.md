## general info

Termdebug can be used to debug programs with `gdb` inside `vim`.

Termdebug has three windows.

The upper window has the source code where the current line is highlighted.

The middle window has the terminal output of the program being debugged.

The bottom window has the `gdb` cli.

#### enabling termdebug

Put this line in your `.vimrc`:
```
packadd! termdebug
```

## usage

#### starting Termdebug

Open a source file in vim:
```
vim src/main.c
```

Compile your program with debug symbols.

Then start termdebug like this:
```
:Termdebug --args ./build/src/cmark --ast list.md
```

Gnu debugger for C.

#### installation

```
sudo apt install gdb
```

But there was no man page installed for gdb.

***

## usage

#### compile your program with gcc

You **can't** use gdb on C source code directly.\
You have to compile the source code first.\
And you should probably compile it with debugging flags.\
Then you can use gdb on your executable.

https://linux.die.net/man/1/gdb

```
gcc -g option flag
option	description
-g0	no debug information
-g1	minimal debug information
-g	default debug information
-g3	maximal debug information
```

```
gcc -g3 hw.c -o hw.out
```

But how to set breakpoints or step through code?

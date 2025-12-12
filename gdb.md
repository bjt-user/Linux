Gnu debugger for C.

#### installation

```
sudo apt install gdb
```

But there was no man page installed for gdb.

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

https://web.eecs.umich.edu/~sugih/pointers/gdbQS.html

```
gdb hw.out
```

Then inside gdb you have to specify the **source file** to set a breakpoint (not the output file):
```
(gdb) break hw.c:1
Breakpoint 1 at 0x1139: file hw.c, line 4.
```
(I wanted to set the breakpoint on line 1 but the first line of the main method is in line 4, so it sets it there)

Then type  `run`:
```
(gdb) run
Starting program: /home/bf/Coding/C/hello_world/hw.out 

Breakpoint 1, main () at hw.c:4
4		printf("hello world\n");
```

Then type `n` to step through the code:
```
(gdb) n
hello world
5		return 0;
(gdb) n
6	}
```

## building

```
git clone https://sourceware.org/git/binutils-gdb.git
```

```
./configure
```

```
make -j$(nproc)
```

Took about 6-8 minutes.\
Load average rose to 7.

Binary seems to be here: `gdb/gdb`

Maybe there is a way to only build `gdb` because there is a Makefile and \
a Makefile.in in the `gdb` dir.

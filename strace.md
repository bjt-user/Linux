## general info

```
man strace
```

```
strace - trace system calls and signals
```

## usage

#### how to use

```
strace bash helloworld.sh
```

It will show all system calls that will be executed in the first column.\
There is a man page for every system call.\
For example `man execve`.

#### follow child processes

```
strace -f ./a.out &>> a-strace.log
```

#### generate report

To get an overview of the syscalls executed and how many times they were executed:
```
strace -c openssl s_client -connect google.com:443
```

***

## filtering the output

#### -e trace=syscall

```
strace -e trace=write locate 'stdio.h'
```

#### with grep

For some reason `strace` writes all its output to stderr.\
So you need to redirect to grep:
```
strace openssl s_client -connect google.com:443 2>&1 | grep -i "^connect"
```

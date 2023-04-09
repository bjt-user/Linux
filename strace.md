```
man strace
```

```
strace - trace system calls and signals
```

#### how to use

```
strace bash helloworld.sh
```

It will show all system calls that will be executed in the first column.\
There is a man page for every system call.\
For example `man execve`.

#### generate report

To get an overview of the syscalls executed and how many times they were executed:
```
strace -c openssl s_client -connect google.com:443
```

***

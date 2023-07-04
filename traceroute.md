This seems to be the source code:

https://github.com/openbsd/src/tree/master/usr.sbin/traceroute

2 files with 1000 lines each, seems easy to compile\
=> its a weird Makefile, will probably only compile on OpenBSD.\
Doesnt work on Linux.

Seems to use header files that don't exist on Linux:
```
traceroute.c:252:19: fatal error: event.h: No such file or directory
 #include <event.h>
                   ^
compilation terminated.
worker.c:80:17: fatal error: asr.h: No such file or directory
 #include <asr.h>
```

#### installation with package manager

```
sudo pacman -S traceroute
```

***

#### basic usage

```
traceroute google.com
```

or get the ip first
```
nslookup google.com
```
and use the ip
```
traceroute 216.58.212.174
```

#### port

```
traceroute google.com -p 22
```

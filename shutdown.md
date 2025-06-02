#### shutdown the computer at a specific time

```
shutdown 11:35
```

Then this file will be created:
```
$ cat /run/systemd/shutdown/scheduled
USEC=1748856900000000
WARN_WALL=1
MODE=poweroff
UID=1000
TTY=pts/0
```

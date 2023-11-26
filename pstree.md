To get the pstree of just one process:
```
pstree <pid>
```

```
$ ps -ef | grep -i "pulse"
bf          1393    1382  0 07:34 ?        00:03:28 /usr/bin/pulseaudio --daemonize=no --log-target=journal
bf         11921   11776  0 13:45 pts/3    00:00:00 grep -i pulse
$ pstree 1393
pulseaudio───3*[{pulseaudio}]
```

#### combining with watch

Using the parent process id of /bin/bash for example and \
setting the watch to 0.1s (which is the lowest possible interval):
```
$ ps -ef | grep -i "bash"
bf         12070   12043  0 13:48 pts/0    00:00:00 /bin/bash
bf         13726   12070  0 13:51 pts/0    00:00:00 grep -i bash
$ watch -n 0.1 pstree 12043
```

#### combination with pgrep

```
$ pgrep "firefox"
2475
$ pstree 2475
firefox─┬─4*[Isolated Web Co───18*[{Isolated Web Co}]]
        ├─Isolated Web Co───30*[{Isolated Web Co}]
        ├─Isolated Web Co───21*[{Isolated Web Co}]
        ├─Isolated Web Co───22*[{Isolated Web Co}]
        ├─Privileged Cont───18*[{Privileged Cont}]
        ├─RDD Process───4*[{RDD Process}]
        ├─Socket Process───5*[{Socket Process}]
        ├─Utility Process───9*[{Utility Process}]
        ├─WebExtensions───18*[{WebExtensions}]
        └─122*[{firefox}]
```

#### show entire commands

```
pstree -al 2475
```

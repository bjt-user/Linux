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

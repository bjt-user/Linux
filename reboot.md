#### symlink

On Arch Linux `reboot` is a symlink to `systemctl`:
```
$ ls -l /usr/bin/reboot 
lrwxrwxrwx 1 root root 9 Apr 18 22:42 /usr/bin/reboot -> systemctl
```

#### TODO: differences vs. reboot and poweroff/shutdown now

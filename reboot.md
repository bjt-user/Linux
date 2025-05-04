#### symlinks to systemctl

On systemd based systems it looks like this.

For example on Arch Linux:
```
$ ls -l /usr/bin/reboot /usr/bin/shutdown /usr/bin/poweroff
lrwxrwxrwx 1 root root 9 Apr 18 22:42 /usr/bin/poweroff -> systemctl
lrwxrwxrwx 1 root root 9 Apr 18 22:42 /usr/bin/reboot -> systemctl
lrwxrwxrwx 1 root root 9 Apr 18 22:42 /usr/bin/shutdown -> systemctl
```

#### TODO: differences vs. reboot and poweroff/shutdown now

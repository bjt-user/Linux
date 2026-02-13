#### symlinks to systemctl

On systemd based systems it looks like this.

For example on Arch Linux:
```
$ ls -l /usr/bin/reboot /usr/bin/shutdown /usr/bin/poweroff
lrwxrwxrwx 1 root root 9 Apr 18 22:42 /usr/bin/poweroff -> systemctl
lrwxrwxrwx 1 root root 9 Apr 18 22:42 /usr/bin/reboot -> systemctl
lrwxrwxrwx 1 root root 9 Apr 18 22:42 /usr/bin/shutdown -> systemctl
```

#### differences vs. reboot and poweroff/shutdown now

The NIC (network interface card) will probably not reset when rebooting.\
It might still have cached information.

It is hard to find information about that.

When upgrading your system (and stuff like `NetworkManager`) it might make sense \
to shutdown the PC for a few minutes, so that the NIC is cleared and can initialize cleanly.

#### service units

On a `reboot` the `ExecStop` directives of all systemd services seem to \
get triggered.\
So all systemd services do a graceful shutdown.

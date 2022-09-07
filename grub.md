#### disable boot-menu

How to ignore the boot-menu so I can also boot directly into my os?

I try this:

Add this to /etc/default/grub:
```
GRUB_DISABLE_OS_PROBER=true
```

=> did not work

So i try `vim /etc/default/grub`:
```
GRUB_TIMEOUT=0
```

Also did not work.
But I forgot to
```
sudo update-grub
```
=> command not found\
https://askubuntu.com/questions/418666/update-grub-command-not-found

```
sudo vim /usr/sbin/update-grub
```

Enter this content (simple shell script):
```
#!/bin/sh
set -e
exec grub-mkconfig -o /boot/grub/grub.cfg "$@"
```

Then run these:
```
sudo chown root:root /usr/sbin/update-grub
sudo chmod 755 /usr/sbin/update-grub
```

Now I can enter:
```
sudo update-grub
```

Now I can do:
```
sudo reboot
```

And the grub boot menu is not showing anymore!

#### troubleshooting

In a fedora-server VM after following the steps:
```
$ sudo update-grub
/usr/sbin/update-grub: line 4: grub-mkconfig: not found
```

unresolved issue...

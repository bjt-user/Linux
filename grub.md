#### disable boot-menu

How to ignore the boot-menu so I can also boot directly into my os?

I try this:

Add this to `/etc/default/grub`:
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

***
#### update-grub

https://unix.stackexchange.com/questions/111889/how-do-i-update-grub-in-arch-linux#111924

The update-grub command is just a script which runs the grub-mkconfig tool to generate a grub.cfg file. See the Archlinux GRUB documentation. It refers to the following:
```
# grub-mkconfig -o /boot/grub/grub.cfg
```

#### start script from grub in debian

1. Create the script file on the root file system of the system you want to boot.

1. Edit the GRUB configuration file (usually located at /etc/default/grub) and add the following line to the end of the file:

```
GRUB_CMDLINE_LINUX="init=/path/to/script"
```

1. Replace "/path/to/script" with the full path to your script file.

1. Run the following command to update the GRUB configuration:

```
sudo update-grub
```
1. Reboot the system. The script will be executed during the boot process and its output will be displayed on the console.

maybe add a `clear` at the start of the script

you cant seem to exit with ctrl + c but with ctrl alt delete

=> but you cant use this for webscraping scripts because grub does not seem to have internet access.\
you probably need to be in the os to access the internet.

***
#### troubleshooting

In a **fedora**-server VM after following the steps:
```
$ sudo update-grub
/usr/sbin/update-grub: line 4: grub-mkconfig: not found
```


> Unter Fedora und openSUSE führen Sie stattdessen `grub2-mkconfig -o /path/to/grub.cfg` aus\
Michael Kofler - Linux (das umfassende Handbuch)

I did this:
```
grub2-mkconfig -o /etc/grub2.cfg
```
=> that worked (the `GRUB_TIMEOUT=0` did the trick, not the `GRUB_DISABLE_OS_PROBER=true` part)



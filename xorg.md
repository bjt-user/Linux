#### resources

https://magcius.github.io/xplain/article/index.html

https://wiki.archlinux.org/title/Xorg

#### log file

On Arch Linux `/var/log/Xorg.0.log` is the log file for the last xorg startup.

You can for example search for `pci` to look for when your graphics driver is loaded.

On Fedora the log file is `/home/bf/.local/share/xorg/Xorg.0.log`.\
(found it by doing a `lsof -p` on the `pid` of `xorg`)

---

#### installation (without a window manager)

```
sudo pacman -S xorg
```
```
sudo pacman -S xorg-xinit xterm
```

then you can do a 
```
startx
```
=> which gets you multiple xterms, but weirdly arranged\
=> also gives you a mouse

to end xorg <kbd>ctrl</kbd> + <kbd>d</kbd> on all xterms worked

#### xset

This program is used to set various user preference options of the display.

Show current configurations:
```
xset q
```

#### screensaver

Turn off screensaver permanently create these two files:
```
$ cat /etc/X11/xorg.conf.d/10-extensions.conf
Section "Extensions"
    Option "DPMS" "false"
EndSection
```
```
$ cat /etc/X11/xorg.conf.d/10-serverflags.conf
Section "ServerFlags"
    Option "BlankTime" "0"
EndSection
```
(https://wiki.archlinux.org/title/Display_Power_Management_Signaling#Configuration)

default timeout seems to be 600 seconds (10 minutes)
```
xset -q
```

turn off screensaver:
```
xset -dpms
xset s off
```

## troubleshooting

#### startx: command not found

After installing this:
```
sudo pacman -S xorg-xinit
```
I could use `startx` but it did not launch into i3.

You need to do this first:
```
cp /etc/X11/xinit/xinitrc /home/bf/.xinitrc
```
Then edit it:
``` 
vim ~/.xinitrc
```

delete the last 5 lines after `fi`.\
Then insert this at the last line:
```
exec i3
```

reboot, login as a normal user and do:
```
startx
```
=> and `i3` was started!

---

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

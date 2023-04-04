#### resources

https://magcius.github.io/xplain/article/index.html

#### log file

On Arch Linux `/var/log/Xorg.0.log` is the log file for the last xorg startup.

You can for example search for `pci` to look for when your graphics driver is loaded.

On Fedora the log file is `/home/bf/.local/share/xorg/Xorg.0.log`.\
(found it by doing a `lsof -p` on the `pid` of `xorg`)

***
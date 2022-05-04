To see which display server is running:
```
loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}'
```
or (if you have an idea of what could be running):
```
ps -e | grep X
```
``` output
856 tty2     00:00:54 Xorg
```

---

## How to change the display server/windowing system:

In Debian and Ubuntu you can change between X11 and wayland in the login menu.
To see which display server is running:
```
loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}'
```
or (if you have an idea of what could be running):
```
ps -e | grep X
```
``` output
856 tty2     00:00:54 Xorg

---

#### what is a display server
A display server is a protocol, not a program you can install.

#### xorg/x11 vs wayland

wayland seems to be more modern.\
xorg is older and the trend seems to go towards wayland because it seems to be easier to work with it as a developer.

But a lot of applications don't work with wayland yet, because with wayland the application has to draw its own window.

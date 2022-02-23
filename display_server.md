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

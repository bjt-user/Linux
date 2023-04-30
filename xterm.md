xterm is the standard terminal emulator for the X Window System.

https://wiki.archlinux.org/title/Xterm

type `xterm` to start a fast terminal emulator

#### configure background color and font size

```
$ cat ~/.Xresources 
xterm*font:     *-fixed-*-*-*-18-*
XTerm*Background: black
XTerm*Foreground: white
```

then
```
xrdb ~/.Xresources
```
or
```
XTerm.vt100.reverseVideo: true
```

#### TODO: configure the font

see available fonts:
```
xlsfonts | less
```
set font temporarily:
``` 
xterm -fn r16
```

to test some fonts:
```
xterm -fn "$(xlsfonts | fzf)"
```

How to install new font for xterm?

There is a config file at `/etc/X11/app-defaults/XTerm`

I don't know why, but this looked good:
```
xterm*faceName: DejaVu Sans Mono
xterm*faceSize: 16

XTerm.vt100.reverseVideo: true
```

you can also do
```
xterm*faceName: Inconsolata
```
but `DejaVu Sans Mono` looks better.

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

#### TODO: configure the font

xterm is the standard terminal emulator for the X Window System.

https://wiki.archlinux.org/title/Xterm

type `xterm` to start a fast terminal emulator

https://www.youtube.com/watch?v=mAUQsNUnk9I

have a file `~/.Xresources` and\
put
```
xrdb ~/.Xresources
```
in your `.bashrc`

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

#### configure the font

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

#### copy and paste from and to clipboard

This will make ctrl + shift + c/v work.\
And also anything you select with your mouse will automatically put in your clipboard.\
You can also paste in with your middle mouse button.
```
xterm.vt100.translations: #override \n\
  Ctrl Shift <Key>C: copy-selection(CLIPBOARD) \n\
  Ctrl Shift <Key>V: insert-selection(CLIPBOARD) \n\
  <Btn1Up>: select-end(PRIMARY, CLIPBOARD, CUT_BUFFER0) \n\
  <Btn2Up>: insert-selection(PRIMARY)
```


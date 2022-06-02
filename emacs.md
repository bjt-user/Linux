It looks like you can use `emacs` with a Desktop Environment (xorg) and also without it.

```
sudo dnf install emacs
```

```
emacs
```

#### exiting emacs

<kbd>ctrl</kbd> + <kbd>x</kbd> and then directly after that <kbd>ctrl</kbd> + <kbd>c</kbd>\
(seems like you can keep <kbd>ctrl</kbd> pressed)

***
with <kbd>F10</kbd> you can go into the menu and navigate with arrow keys

<kbd>alt</kbd> + <kbd>x</kbd> then enter `dired` choose a directory hit enter\
then you can choose a file with arrowkeys and hit enter to go into that file\
But how do I exit out of that file?

#### keybinding

emacs is older than the <kbd>alt</kbd> key, back in the day it was called `meta`, so when you see <kbd>m</kbd> it actually means <kbd>alt</kbd>.

<kbd>m</kbd> = <kbd>alt</kbd>\
<kbd>C</kbd> = <kbd>ctrl</kbd>\
<kbd>S</kbd> = <kbd>shift</kbd>\
<kbd>s</kbd> = <kbd>super</kbd> (`Windows key`)

#### problem: info messages too blue

Info messages at the bottom of the screen are dark blue and hard to read...

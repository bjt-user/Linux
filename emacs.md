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

#### quitting the prompt
when youre stuck inside a prompt do this:\
`ctrl + g`

#### keybinding

emacs is older than the <kbd>alt</kbd> key, back in the day it was called `meta`, so when you see <kbd>m</kbd> it actually means <kbd>alt</kbd>.

<kbd>m</kbd> = <kbd>alt</kbd>\
<kbd>C</kbd> = <kbd>ctrl</kbd>\
<kbd>S</kbd> = <kbd>shift</kbd>\
<kbd>s</kbd> = <kbd>super</kbd> (`Windows key`)

#### problem: info messages too blue

Info messages at the bottom of the screen are dark blue and hard to read...\
With <kbd>alt</kbd>+<kbd>x</kbd> `list-colors-display` you can see the all the colors emacs knows about in the current display.\
with c-x o you can cycle through windows\
but it is read-only

```
touch ~/.emacs.d/init.el
vim ~/.emacs.d/init.el
```
put in this line
```
(setq frame-background-mode 'dark)
```

#### proxy
alt + x `package-install` enter \
now it seems it can't get past the proxy

try putting this code into the `~/.emacs.d/init.el`:\
https://www.emacswiki.org/emacs/InstallingPackages#h5o-4

seems to have worked.

but i cant find package `evil`. how do i search for packages and update packages?\
https://www.emacswiki.org/emacs/Evil

#### evil mode

put this in `init.el`:
```
(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
```

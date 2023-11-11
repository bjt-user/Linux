https://wiki.archlinux.org/title/Xorg/Keyboard_configuration#Setting_keyboard_layout

#### xorg

see your currently used configuration:
```
$ setxkbmap -query
rules:      evdev
model:      pc105
layout:     de,de,us
variant:    us,nodeadkeys,
```

set the layout to german:
```
setxkbmap de
```

***

#### alpine linux

After booting into the iso. (operating system is not installed yet)
```
setup-keymap
```

***

On Ubuntu (Gnome) there is the keyboard layout "German (US)" where you can do Umlauts with <kbd>alt gr</kbd> + <kbd>a/ä</kbd>.\
That seems to work fine.


```
$ localectl list-x11-keymap-variants de
T3
deadacute
deadgraveacute
deadtilde
dsb
dsb_qwertz
dvorak
e1
e2
mac
mac_nodeadkeys
neo
nodeadkeys
qwerty
ro
ro_nodeadkeys
ru
tr
us
```

adjusted `/etc/X11/xorg.conf.d/00-keyboard.conf` to this:
```
Section "InputClass"
	Identifier "system-keyboard"
	MatchIsKeyboard "on"
	Option "XkbLayout" "de"
	Option "XkbVariant" "us"
	Option "XkbModel" "pc105" #means there are 105 keys on your keyboard
EndSection
```
reboot/
=> and it works (might not work when `gnome` is installed, see below)

the `pc105` you need to adjust so that it fits your current keyboard

#### gnome

Even when you are not using `gnome`, but `gnome` is installed\
`dconf` will mess with your keyboard layout.

So to just use your X11 settings you have to set this value:
```
dconf read /desktop/ibus/general/use-system-keyboard-layout
true
```

---

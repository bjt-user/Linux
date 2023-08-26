https://wiki.archlinux.org/title/Xorg/Keyboard_configuration#Setting_keyboard_layout

#### xorg

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

adjusted `/etc/X11/xorg.conf.d/00-keyboard.conf` to this:
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,de"
		Option "XkbVariant" ",nodeadkeys"
        Option "XkbModel" "pc105"
EndSection
```
now reboot\
=> now it is us-layout, but no Umlauts are possible

try this and reboot:
```
Section "InputClass"
	Identifier "system-keyboard"
	MatchIsKeyboard "on"
	Option "XkbLayout" "us,de"
	Option "XkbVariant" "altgr-intl,nodeadkeys"
	Option "XkbModel" "pc105" #means there are 105 keys on your keyboard
EndSection
```

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

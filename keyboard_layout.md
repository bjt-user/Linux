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
now reboot

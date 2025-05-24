## general info

"LightDM is a cross-desktop display manager"

You can comfortably login to your X11 session without typing `startx`.

#### resources

https://wiki.archlinux.org/title/LightDM

#### installation

```
sudo pacman -S lightdm
sudo pacman -S lightdm-gtk-greeter
```

```
sudo systemctl enable --now lightdm
sudo reboot
```

## usage

#### booting into i3

You might need to select `i3` in the upper right corner instead of `XSession`.

Then this will become the default.

***

## troubleshooting

#### switch back to linux terminal

If you `lightdm` is started up, but you forgot to install stuff, you can go back to the terminal with:\
<kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>F1</kbd>\
then:\
<kbd>alt</kbd> + <kbd>F3</kbd>

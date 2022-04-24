This will show various `gnome` settings:
```
gsettings list-recursively org.gnome.desktop.interface
```

#### Disabling the lock-screen
(meaning you don't have to log in again after the pc goes into standby after some time (automatic suspend))
```
gsettings set org.gnome.desktop.lockdown disable-lock-screen 'true'
```
----------------------------------------------------------------------------------------------------------------------

#### showing the day of the week
```
gsettings set org.gnome.desktop.interface clock-show-weekday true
```
***

#### disable cursor blinking

```
gsettings set org.gnome.desktop.interface cursor-blink false
```

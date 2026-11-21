#### suspend system

```
systemctl suspend
```

#### i3: lock screen and suspend

```
sudo pacman -S xss-lock
```

You can use `xss-lock` with `i3lock` to automatically lock the screen \
when going into suspend.

You need this line so that `xss-lock` will always run in the background.
```
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
```

You need this for the key bind.\
`sleep 3` is needed so that releasing the mod key will not instantly resume \
the system.
```
bindsym $mod+F8 exec --no-startup-id sleep 3 && systemctl suspend
```

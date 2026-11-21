#### suspend system without lock screen

```
systemctl suspend
```

#### TODO: lock screen and suspend

You can use `xss-lock` with `i3lock` to automatically lock the screen \
when going into suspend.

But when binding a keybinding in `i3` to a script that just suspends, the \
system will immediatelly wake up from suspend...

Maybe the problem is that `xss-lock` runs in the wrong session?\
Reboot and try again or try `loginctl lock-session` to lock the screen...

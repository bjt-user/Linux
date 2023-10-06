Passwords are stored in `~/.password-store`.

To paste the password of a record into your clipboard for 45 seconds:

```
pass -c examplewebsite.com
```

## troubleshooting

### tab-completion does not work

The problem was that I deleted a lot in `/etc/bashrc`.\
This fixed it:\
put this in `/etc/bashrc`:
```
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
```

On Arch Linux is still did not work.
```
sudo pacman -S bash-completion
```
fixed it.

#### copying to clipboard did not work

In a WSL arch instance, `pass -c` did not work.\
Installing `wl-clipboard` fixed this. (no idea why this is not installed as a dependency)
```
$ pass -c website.com/myuser
/usr/sbin/pass: line 180: wl-copy: command not found
Error: Could not copy data to the clipboard
```
Fix:
```
sudo pacman -S wl-clipboard
```

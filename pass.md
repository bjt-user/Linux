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

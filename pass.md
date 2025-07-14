## general info

Passwords are stored in `~/.password-store`.

## usage

#### paste to clipboard

To paste the password of a record into your clipboard for 45 seconds:

```
pass -c examplewebsite.com
```

#### totp (time based one time password / 2 factor authentication)

```
pass otp insert service/username
```

You to insert a URI that looks like this:
```
otpauth://totp/myuser?secret=RH7ATYI5Y3H46LDTE74BB7PJ4YARGTK5&issuer=someissuer
```

Then you can get a one time password that lasts 30 seconds like this:
```
pass otp service/username
```

#### pass generate

Generate and insert a password for a new service:
```
pass generate fooservice.com/myemail@gmail.com
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

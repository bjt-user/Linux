#### remote command

to just execute a remote command and then return instantly back to the current host:
```
ssh myserver 'cat /etc/os-release'
```

#### ssh in arch linux
```
pacman -S openssh
systemctl enable --now sshd
```

You need this line in `/etc/ssh/sshd_config`: (remove `#` and add the `yes`)
```
PermitRootLogin yes
```

```
systemctl restart sshd
```

#### verbose output

verbose output will help troubleshooting:
```
ssh -v user@myserver
```
or even more verbose:
```
ssh -vvv user@myserver
```

#### generating ssh keys

to use a different encryption than rsa: (see `ssh-keygen --help` for available encryptions)
```
ssh-keygen -t dsa
```

ed25519 produces very short private and public keys:
```
ssh-keygen -t ed25519
```
## troubleshooting

#### permissions of private key

Sometimes a connect does not work because of bad permissions of the private key.\
Fix it like this:
```
chmod 600 id_rsa
```

#### permissions of remote .ssh folder and authorized_keys

I could not connect via ssh keys to a remote system.

Solution on the remote host:
```
cd ~/.ssh
chmod 755 .
chmod 644 authorized_keys
```

---

#### sshfs

You can mount a remote server with `sshfs`:
```
sshfs myuser@raspberrypi:/home/myuser /raspberrypi_home
```
(the mountpoint `/raspberrypi_home` has to exist and the user needs write permissions)

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

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

## troubleshooting

#### permissions of private key

Sometimes a connect does not work because of bad permissions of the private key.\
Fix it like this:
```
chmod 600 id_rsa
```

***

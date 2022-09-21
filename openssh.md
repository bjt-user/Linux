To connect to another computer in the network you need an openssh client on your side\
and an openssh server that runs on the other side.

connect to a network:
```
ssh user@hostname/ip
```

This command seems to show if `openssh server` is running:
```
systemctl status sshd
```


## Troubleshooting

#### permission denied

I get a permission denied when trying to ssh into root user, even though I typed the right password.\
This was on a new Arch install.

To resolve this issue, edit the `/etc/ssh/sshd_config` file and change the following entries.
```
#PermitRootLogin prohibit-password
#PasswordAuthentication yes
```
The above entries should be as shown below:
```
PermitRootLogin yes
PasswordAuthentication yes
```

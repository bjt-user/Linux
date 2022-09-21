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

I get a permission denied, even though I typed the right password.\
This was on a new Arch install.\
Maybe because time was not synchronized or NTP is no...

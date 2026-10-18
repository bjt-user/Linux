## 2026-10-18

First go into EFI shell and remove old boot options.

And now we will try to do the installation over ssh so we can work with \
a big screen and a nice terminal emulator.

#### (optional) increase font size

```
setfont -d
```

#### setup wifi

```
iwctl station list
```

```
iwctl station wlan0 scan
```

```
iwctl station wlan0 get-networks
```

```
iwctl --passphrase 123... station wlan0 connect my-ssid
```

```
curl -I https://example.com
```

#### setup openssh server

`sshd` service should already be active.

Either do `passwd` to set a root password or create an `authorized_keys` file.

```
vim /etc/ssh/sshd_config
```
=> `PermitRootLogin yes`

```
systemctl restart sshd
```

```
ip -4 a
```

And then you can connect from your desktop to the machine.

There might also be a DNS entry `archiso` which points to the installation \
machine.

So
```
ssh root@archiso
```
worked as well.

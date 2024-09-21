#### understanding ntp

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/ch-configuring_ntp_using_ntpd

#### enable ntp

```
$ sudo timedatectl set-ntp true
```

#### set timezone

```
sudo ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
```

or

```
sudo timedatectl set-timezone Europe/Berlin
```

But why does `date` not show 24 hour clock in Rocky Linux?

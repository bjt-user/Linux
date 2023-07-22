#### keep NetworkManager away from /etc/resolv.conf

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/manually-configuring-the-etc-resolv-conf-file_configuring-and-managing-networking

```
sudoedit /etc/resolv.conf
```
put this in it:
```
[main]
dns=none
```

```
systemctl reload NetworkManager
```

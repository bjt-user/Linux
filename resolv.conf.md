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

#### search keyword

You can put the suffix of a fully qualified domain name into `/etc/resolv.con`:

```
search exampledomain.com
```

Then you can do a
```
nslookup myserver
```
for a server with a FQDN "myserver.exampledomain.com".

***

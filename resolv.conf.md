#### keep NetworkManager away from /etc/resolv.conf

https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/manually-configuring-the-etc-resolv-conf-file_configuring-and-managing-networking#manually-configuring-the-etc-resolv-conf-file_configuring-and-managing-networking

```
sudo -i
```

create this file:
```
touch /etc/NetworkManager/conf.d/90-dns-none.conf
```

put in:
```
[main]
dns=none
```

```
systemctl restart NetworkManager
```

#### resolve.conf on RedHat

`/etc/resolve.conf` is managed by systemd on Red Hat systems:
```
$ realpath /etc/resolv.conf
/run/systemd/resolve/stub-resolv.conf
```

```
resolvectl
```

```
/etc/systemd/resolved.conf.d
```

Configfiles in this dir can look like this:
```
/etc/systemd/resolved.conf.d$ cat dns.conf
[Resolve]

DNS=10.100.1.12
FallbackDNS=10.100.1.11

Domains=mydomain.com

LLMNR=no
Cache=no-negative
```

You need to restart this service after any changes:
```
sudo systemctl restart systemd-resolved.service
```

#### search keyword

You can put the suffix of a fully qualified domain name into `/etc/resolv.conf`:

```
search exampledomain.com
```

Then you can do a
```
nslookup myserver
```
for a server with a FQDN "myserver.exampledomain.com".

***

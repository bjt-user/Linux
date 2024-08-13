#### resolve.conf

`/etc/resolve.conf` is managed by systemd these days:
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

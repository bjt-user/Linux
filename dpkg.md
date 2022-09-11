**package manager for debian**

I try to install a debian package with dkpg and not with apt.\
apt uses dpkg under the hood.

I try to install virtualbox which is not available in apt.

```
sudo dpkg -i virtualbox-6.1_6.1.38-153438~Debian~bullseye_amd64.deb
```

Now it seems to be installed.\
But I can't find it with `apt list <pkgname>`.

I can view it like this:
```
sudo dpkg-query -l | grep "virtual"
```

#### install a deb package with apt

try to install a `.deb` package with `apt`
```
sudo apt install /path/to/package/name.deb
```
https://unix.stackexchange.com/questions/159094/how-to-install-a-deb-file-by-dpkg-i-or-by-apt

=> I tried this with `flatap`.
1. you need to specifiy the **full** path
2. it seems you need to install all the dependencies before...

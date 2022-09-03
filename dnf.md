Paketmanager für `Red Hat` Distros. (z.B. `fedora`, `oracle linux`, `centos`, `red hat enterprise linux`)

```
sudo dnf repolist
```
will show all repositories that `dnf` gets packages from.

Repositories can be configured in
```
/etc/yum.repos.d
```
#### TODO: where files are installed

try this:
https://unix.stackexchange.com/a/715986/438538

***
#### repositories
`epel` - extra packages for enterprise linux

#### add a repository

```
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```
(version 9 is available and I used that, but the system uses 8 because the docker container was oracle linux 8)\
this did not work on `Fedora 36` machine

to see where those files have been installed:
```
rpm -ql epel-release
```

to verify that the repository is enabled:
```
dnf repolist -v
```

But I get an error installing an `epel` package:
```
Curl error (37): Couldn't read a file:// file for file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8 [Couldn't open file /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8]
```

```
rpm --import http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
```

And now it works! I can install `epel` packages.

The problem might have been that I installed `epel` version 9 on `oracle linux` 8.\
Maybe you don't have to import the gpg key when you pick the right version.\
Yes there is a `RPM-GPG-KEY-EPEL-9` in `/etc/pki/rpm-gpg`.

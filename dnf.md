Paketmanager für `Red Hat` Distros. (z.B. `fedora`, `oracle linux`, `centos`, `red hat enterprise linux`)

```
sudo dnf repolist
```
will show all repositories that `dnf` gets packages from.

Repositories can be configured in
```
/etc/yum.repos.d
```

#### repositories
`epel` - extra packages for enterprise linux

#### add a repository

```
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```
(version 9 is available)

to see where those files have been installed:
```
rpm -ql epel-release
```

to verify that the repository is enabled:
```
dnf repolist -v
```

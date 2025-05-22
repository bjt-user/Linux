## general info

#### stage3 files/containers

https://wiki.gentoo.org/wiki/Stage_file

You can download stage 3 files from gentoo.org/downloads

This is a tar.gz of a root file system.\
It can be used as a docker container or wsl distro.

But it does not have `vi` or `vim` installed.

Before you can install packages in this container:
```
emerge --sync
```
(took about 5 minutes)

This worked for installing `vim`:
```
emerge --ask --verbose vim
```
(took about 1-2 minutes)

## portage

#### update repositories

```
emerge --sync
```

or if behind a firewall:
```
emerge-webrsync
```

#### show info

```
emerge --info
```

even more info:
```
emerge --info --verbose
```

Info about a specific "atom":
```
emerge --info vim
```

#### search for packages

Search with regex:
```
emerge -s '^vim$'
```

Also search in the description:
```
emerge --searchdesc 'nslookup'
```

Search for all packages in a category:
```
emerge -s '@app-vim'
```

#### uninstall package

This should be enough:
```
emerge --ask --verbose --depclean net-proxy/tinyproxy
```

You can also do it in 2 commands.

https://wiki.gentoo.org/wiki/Gentoo_Cheat_Sheet#Package_removal

```
emerge --deselect vim
```

```
emerge -a --depclean
```

## troubleshooting

#### firewalls

If you are behind a firewall use this for syncing instead of `emerge --sync`:
```
emerge-webrsync
```

This will probably use `https` over 443 instead of `rsync` over port 22.

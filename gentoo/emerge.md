## general info

https://wiki.gentoo.org/wiki/Emerge

`man emerge`

## usage

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

#### pretend (dry-run)

This will show use flags and dependencies that would be installed:
```
emerge -p vim
```

To show dependencies in a primitive tree style:
```
emerge -tp vim
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

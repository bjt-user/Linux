## general info

https://wiki.archlinux.org/title/Rsync

```
rsync [Quelle] [Ziel]
```

"~" funktioniert nicht, man muss "/home/myuser" nutzen

example to back up a folder on a second pc:
```
rsync -aAxv --delete /home/myuser/Documents myuser@[hostname]:/home/myuser
```
or (what I did before I knew you could just use the hostname...):
```
rsync -aAxv --delete /home/myuser/Documents myuser@[ip-address of the other pc]:/home/myuser
```
to get the ip of the second pc type: `hostname -I` on that pc\
(but just using the hostname is way better)

***

Neues Problem nach Ubuntu-Neuinstallation und Wifi-Chipwechsel:

ssh: connect to host 192.168.*.*** port 22: Connection refused
rsync: connection unexpectedly closed (0 bytes received so far) [sender]
rsync error: unexplained error (code 255) at io.c(235) [sender=3.1.3]

=> Lösung: Ich musste auf dem Ubuntu-Laptop erst wieder den "openssh-server" installieren.
sudo apt install openssh-server

## usage

#### -v / --verbose

Increase verbosity.

#### --dry-run, -n

Perform dryrun.

#### --delete

```
--delete
This tells rsync to delete extraneous files from the receiving side (ones that aren't on the sending side),
but only for the directories  that are being synchronized.
```

#### -r / --recursive

```
--recursive, -r
This tells rsync to copy directories recursively.
```

#### --exclude

```
--exclude=PATTERN
This option is a simplified form of the --filter option that specifies an exclude rule
and does not allow the full rule-parsing syntax of  normal filter rules.
This is equivalent to specifying -f'- PATTERN'.

See the FILTER RULES section for detailed information on this option.
```

example:
```
--exclude "*/workspace/terraform"
```

#### -a / --archive

manpage says this:
```
--archive, -a            archive mode is -rlptgoD (no -A,-X,-U,-N,-H)
```

> It is a quick way of saying you want recursion and want to preserve almost everything.\
Be aware that it does not include preserving ACLs (-A), xattrs (-X), atimes (-U), crtimes (-N),\
nor the finding and preserving of hardlinks (-H).

#### -h / --human-readable

Should change bytes to MegaBytes/GB at the end.

> output numbers in a human-readable format

#### less output

Try `--quiet` flag to produce less output.

## troubleshooting

#### FAIL: full system full system backup

https://wiki.archlinux.org/title/Rsync#Full_system_backup

clearing your systemd logs
```
sudo journalctl --vacuum-time=2d
```
and removing the bullshit file
```
sudo rm -rf /var/log/lastlog
```
should speed up your rsync of `/`

but it still did not work..it finished, but `/home` is empty on the remote side...


#### removing sparse file

The huge "sparse" file `/var/log/lastlog` is a problem when doing an rsync of `/`.\
You might want to exclude that dir as well. Or `/var/log/*` if you dont want to backup your logfiles.\
==> does not work, --exclude of `/var/log/*`, rsync will still want to sync that file...\
excluding `/var/*` also doesnt work\
maybe because rsync already started syncing that file...

I did
```
sudo rm -rf /var/log/lastlog
```
this should not cause issues, it will be recreated after reboot and is a binary file with information about last logins.



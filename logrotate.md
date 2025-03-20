## general info

https://github.com/logrotate/logrotate

#### documentation

```
man logrotate
```

Search for `CONFIGURATION FILE DIRECTIVES`.

#### installation

```
sudo pacman -S logrotate
```

## usage

#### try 2025-03-20

Trying a simple config that should not delete any logs:
```
$ cat /etc/logrotate.d/backup
/home/myuser/logs/*.log {
	rotate -1
}
```

current situation is like this:
```
~/logs $ ls -la
total 56
drwxr-xr-x   2 myuser wheel 36864 Mar 20 19:00 .
drwx--x---+ 39 myuser wheel  4096 Mar 20 19:14 ..
-rw-r--r--   1 myuser wheel  2188 Mar 16 20:00 backup_20250316_200000.log
-rw-r--r--   1 myuser wheel  2452 Mar 17 20:00 backup_20250317_200000.log
-rw-r--r--   1 myuser wheel  2978 Mar 19 20:00 backup_20250319_200000.log
```

=> observe if, what and when something happens in the next days

#### systemd

logrotate is a systemd service unit that is triggered by a systemd timer
```
$ systemctl status logrotate
○ logrotate.service - Rotate log files
     Loaded: loaded (/usr/lib/systemd/system/logrotate.service; static)
     Active: inactive (dead)
TriggeredBy: ● logrotate.timer
       Docs: man:logrotate(8)
             man:logrotate.conf(5)
```

```
myuser@arch-bcity:~/logs $ systemctl status logrotate.timer
● logrotate.timer - Daily rotation of log files
     Loaded: loaded (/usr/lib/systemd/system/logrotate.timer; disabled; preset: disabled)
     Active: active (waiting) since Mon 2024-04-29 12:26:49 CEST; 1h 0min ago
    Trigger: Tue 2024-04-30 00:00:00 CEST; 10h left
   Triggers: ● logrotate.service
       Docs: man:logrotate(8)
             man:logrotate.conf(5)

Apr 29 12:26:49 arch-bcity systemd[1]: Started Daily rotation of log files.
```

The systemd file looks by default like this:
```
[Unit]
Description=Daily rotation of log files
Documentation=man:logrotate(8) man:logrotate.conf(5)

[Timer]
OnCalendar=daily
RandomizedDelaySec=1h
Persistent=true

[Install]
WantedBy=timers.target
```

#### configuration file directives

search the manpage for "CONFIGURATION FILE DIRECTIVES":
```
rotate count
  Log files are rotated count times before being removed or mailed to the address specified in a mail directive.
  If count is 0, old versions are removed rather than rotated.
  If count is -1, old logs are not removed at all, except they are affected by maxage (use with caution, may  waste
  performance and disk space).
  Default is 0.

olddir directory
  Logs  are  moved  into  directory  for rotation.  The directory must be on the same physical device as the log file being rotated, unless copy,
  copytruncate or renamecopy option is used.  The directory is assumed to be relative to the directory holding the log file  unless  an  absolute
  path name is specified.  When this option is used all old versions of the log end up in directory.  This option may be overridden by the noold‐
  dir option.
```

#### TODO: how to remove old log files

#### TODO: how to split up large log files into multiple files

#### debugging logrotate

```
logrotate --debug /etc/logrotate.d/backup
```

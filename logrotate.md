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

## experiments

#### try: 2025-03-27

```
/home/myuser/logs/*.log {
    daily
	rotate -1
	compress
	olddir /home/myuser/logs/archive
    createolddir 755 myuser wheel
}
```

```
myuser@myhost:~/logs $ ls -la
total 48
drwxr-xr-x   3 myuser wheel 36864 Mar 28 15:58 .
drwx--x---+ 39 myuser wheel  4096 Mar 28 19:39 ..
drwxr-xr-x   2 myuser wheel  4096 Mar 28 15:58 archive
-rw-r--r--   1 myuser wheel     0 Mar 28 15:58 backup_20250327_200001.log
myuser@myhost:~/logs $ cd archive/
myuser@myhost:~/logs/archive $ ls -la
total 48
drwxr-xr-x 2 myuser wheel  4096 Mar 28 15:58 .
drwxr-xr-x 3 myuser wheel 36864 Mar 28 15:58 ..
-rw-r--r-- 1 myuser wheel   489 Mar 27 20:00 backup_20250327_200001.log.1.gz
```

Das urspruengliche Logfile ist leer.\
Der Inhalt ist im "olddir" und zwar gezippt in einer gleichnamigen Datei mit einer 1 hintendran.

2025-03-29:

```
$ ls -la
total 52
drwxr-xr-x   3 myuser wheel 36864 Mar 29 08:05 .
drwx--x---+ 39 myuser wheel  4096 Mar 29 17:54 ..
drwxr-xr-x   2 myuser wheel  4096 Mar 29 08:05 archive
-rw-r--r--   1 myuser wheel     0 Mar 29 08:05 backup_20250327_200001.log
-rw-r--r--   1 myuser wheel  1364 Mar 28 20:00 backup_20250328_200000.log
myuser@myhost:~/logs $ ls -la archive/
total 52
drwxr-xr-x 2 myuser wheel  4096 Mar 29 08:05 .
drwxr-xr-x 3 myuser wheel 36864 Mar 29 08:05 ..
-rw-r--r-- 1 myuser wheel    20 Mar 28 15:58 backup_20250327_200001.log.1.gz
-rw-r--r-- 1 myuser wheel   518 Mar 27 20:00 backup_20250327_200001.log.2.gz
```
The new file that is still named after the `backup_20250327_200001.log` is empty.

So this is not what I want.

So I add a `notifempty` directive, so that the empty `backup_20250327...` file will not be rotated anymore.

```
/home/myuser/logs/*.log {
	daily
	rotate -1
	compress
	olddir /home/myuser/logs/archive
	createolddir 755 myuser wheel
	notifempty
}
```

And I cleaned up the log and archive dir:
```
$ ls -la
total 52
drwxr-xr-x   3 myuser wheel 36864 Mar 29 18:06 .
drwx--x---+ 39 myuser wheel  4096 Mar 29 18:06 ..
drwxr-xr-x   2 myuser wheel  4096 Mar 29 18:06 archive
-rw-r--r--   1 myuser wheel  1364 Mar 28 20:00 backup_20250328_200000.log
$ ls -la archive/
total 44
drwxr-xr-x 2 myuser wheel  4096 Mar 29 18:06 .
drwxr-xr-x 3 myuser wheel 36864 Mar 29 18:06 ..
```


## operating principal

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

#### wildcards

From the manpage:
> Please use wildcards with caution.\
If you specify `*`, logrotate will rotate all files, including previously rotated ones.\
A way around this is to use the olddir directive or a more exact wildcard (such as `*.log`).

## configuration file directives

search the manpage for "CONFIGURATION FILE DIRECTIVES".

### rotation

#### rotate

```
rotate count
  Log files are rotated count times before being removed or mailed to the address specified in a mail directive.
  If count is 0, old versions are removed rather than rotated.
  If count is -1, old logs are not removed at all, except they are affected by maxage (use with caution, may  waste
  performance and disk space).
  Default is 0.
```

#### olddir

Seems to be necessary when using wildcards (`*`).\
Otherwise files that have already been rotated will be rotated again.

```
olddir directory
  Logs  are  moved  into  directory  for rotation.  The directory must be on the same physical device as the log file being rotated, unless copy,
  copytruncate or renamecopy option is used.  The directory is assumed to be relative to the directory holding the log file  unless  an  absolute
  path name is specified.  When this option is used all old versions of the log end up in directory.  This option may be overridden by the noold‐
  dir option.
```
example: `olddir /home/myuser/logs/archive`

### file selection

`notifempty` seems to be important.
> Do not rotate the log if it is empty (this overrides the ifempty option).

Otherwise empty files will be created.

`maxage count`
> Remove rotated logs older than <count> days.\
The age is only checked if the logfile is to be rotated. rotate -1 does not hinder removal.\
The files are mailed to the configured address if maillast and mail are configured.

Will maxage remove the logfiles themselves or only the results in olddir?

### files and folders

#### createolddir

example: `createolddir 755 myuser mygroup`

### frequency

Time directives and `size` are mutually exclusive.


## misc

#### TODO: how to remove old log files

#### TODO: how to split up large log files into multiple files

#### debugging logrotate

```
logrotate --debug /etc/logrotate.d/backup
```

You might need `-f` as well.

> Tells logrotate to force the rotation, even if it doesn't think this is necessary.\
Sometimes this is useful after  adding  new  entries  to  a logrotate config file, or if old log files have been removed by hand, as the new files will be created, and logging will continue correctly.

## failed tries

#### FAIL: 2025-03-20

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

2025-03-21 nothing happened:
```
$ ls -la
total 60
drwxr-xr-x   2 myuser wheel 36864 Mar 20 20:00 .
drwx--x---+ 39 myuser wheel  4096 Mar 21 17:50 ..
-rw-r--r--   1 myuser wheel  2188 Mar 16 20:00 backup_20250316_200000.log
-rw-r--r--   1 myuser wheel  2452 Mar 17 20:00 backup_20250317_200000.log
-rw-r--r--   1 myuser wheel  2978 Mar 19 20:00 backup_20250319_200000.log
-rw-r--r--   1 myuser wheel  2240 Mar 20 20:00 backup_20250320_200000.log
```

#### FAIL: 2025-03-21

```
/home/myuser/logs/*.log {
	rotate -1
	compress
}
```

Very weird things happen:
```
$ ls -la
total 172
drwxr-xr-x   2 myuser wheel 36864 Mar 26 20:00 .
drwx--x---+ 39 myuser wheel  4096 Mar 27 18:50 ..
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250316_200000.log
-rw-r--r--   1 myuser wheel    20 Mar 25 19:10 backup_20250316_200000.log.1.gz
-rw-r--r--   1 myuser wheel    20 Mar 24 18:57 backup_20250316_200000.log.2.gz
-rw-r--r--   1 myuser wheel    20 Mar 23 08:25 backup_20250316_200000.log.3.gz
-rw-r--r--   1 myuser wheel    20 Mar 22 05:19 backup_20250316_200000.log.4.gz
-rw-r--r--   1 myuser wheel   672 Mar 16 20:00 backup_20250316_200000.log.5.gz
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250317_200000.log
-rw-r--r--   1 myuser wheel    20 Mar 25 19:10 backup_20250317_200000.log.1.gz
-rw-r--r--   1 myuser wheel    20 Mar 24 18:57 backup_20250317_200000.log.2.gz
-rw-r--r--   1 myuser wheel    20 Mar 23 08:25 backup_20250317_200000.log.3.gz
-rw-r--r--   1 myuser wheel    20 Mar 22 05:19 backup_20250317_200000.log.4.gz
-rw-r--r--   1 myuser wheel   651 Mar 17 20:00 backup_20250317_200000.log.5.gz
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250319_200000.log
-rw-r--r--   1 myuser wheel    20 Mar 25 19:10 backup_20250319_200000.log.1.gz
-rw-r--r--   1 myuser wheel    20 Mar 24 18:57 backup_20250319_200000.log.2.gz
-rw-r--r--   1 myuser wheel    20 Mar 23 08:25 backup_20250319_200000.log.3.gz
-rw-r--r--   1 myuser wheel    20 Mar 22 05:19 backup_20250319_200000.log.4.gz
-rw-r--r--   1 myuser wheel   753 Mar 19 20:00 backup_20250319_200000.log.5.gz
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250320_200000.log
-rw-r--r--   1 myuser wheel    20 Mar 25 19:10 backup_20250320_200000.log.1.gz
-rw-r--r--   1 myuser wheel    20 Mar 24 18:57 backup_20250320_200000.log.2.gz
-rw-r--r--   1 myuser wheel    20 Mar 23 08:25 backup_20250320_200000.log.3.gz
-rw-r--r--   1 myuser wheel    20 Mar 22 05:19 backup_20250320_200000.log.4.gz
-rw-r--r--   1 myuser wheel   644 Mar 20 20:00 backup_20250320_200000.log.5.gz
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250321_200000.log
-rw-r--r--   1 myuser wheel    20 Mar 25 19:10 backup_20250321_200000.log.1.gz
-rw-r--r--   1 myuser wheel    20 Mar 24 18:57 backup_20250321_200000.log.2.gz
-rw-r--r--   1 myuser wheel    20 Mar 23 08:25 backup_20250321_200000.log.3.gz
-rw-r--r--   1 myuser wheel   514 Mar 21 20:00 backup_20250321_200000.log.4.gz
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250322_200000.log
-rw-r--r--   1 myuser wheel    20 Mar 25 19:10 backup_20250322_200000.log.1.gz
-rw-r--r--   1 myuser wheel    20 Mar 24 18:57 backup_20250322_200000.log.2.gz
-rw-r--r--   1 myuser wheel   758 Mar 22 20:00 backup_20250322_200000.log.3.gz
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250323_200000.log
-rw-r--r--   1 myuser wheel    20 Mar 25 19:10 backup_20250323_200000.log.1.gz
-rw-r--r--   1 myuser wheel   667 Mar 23 20:00 backup_20250323_200000.log.2.gz
-rw-r--r--   1 myuser wheel     0 Mar 26 06:42 backup_20250324_200000.log
-rw-r--r--   1 myuser wheel   699 Mar 24 20:00 backup_20250324_200000.log.1.gz
-rw-r--r--   1 myuser wheel  1223 Mar 25 20:00 backup_20250325_200000.log
-rw-r--r--   1 myuser wheel  1489 Mar 26 20:00 backup_20250326_200000.log
```

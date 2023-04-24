#### general

A tool that manages logfiles of `systemd`.

To delete all logs except those that were written in the last 10 hours:
```
sudo journalctl --vacuum-time=10h
```
or to delete everything except to last 2 days:
```
sudo journalctl --vacuum-time=2d
```

It does not work.\
I said `vacuum-time=1h` and I still have logs from three days ago.


to view all logs:
```
journalctl
```

to view the latest logs first (reverse mode):
```
journalctl -r
```

#### show logs of a specific unit in a specific time

```
journalctl -u libvirtd -S today
```

```
-S, --since=, -U, --until=
Start showing entries on or newer than the specified date, or on or older than the specified date, respectively.
Date specifications should be of the format "2012-10-30 18:17:16".
If the time part is omitted, "00:00:00" is assumed.
If only the seconds component is omitted, ":00" is assumed.
If the date component is omitted, the current day is assumed.
Alternatively the strings "yesterday", "today", "tomorrow" are understood, which refer to 00:00:00 of the day before the current day, the current day, or the day after the current day, respectively.  "now" refers to the current time.
Finally, relative times may be specified, prefixed with "-" or "+", referring to times before or after the current time, respectively. For complete time and date specification, see systemd.time(7).
Note that --output=short-full prints timestamps that follow precisely this format.
```

***
#### check out what happened last session

By default journalctl will only show what happened since the last boot.\
But you can also show what happened at past sessions.

```
journalctl -rb -1
```

This can be useful to find out why the shutdown took so long:\
https://itsfoss.com/long-shutdown-linux/

With options `-b -1` you filter the logs for the last boot session. 

#### /var/log/messages
Another way to view logfiles:
```
sudo less /var/log/messages
```
You can also delete messages in vim: `sudo vim /var/log/messages`

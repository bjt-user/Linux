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

***
#### /var/log/messages
Another way to view logfiles:
```
sudo less /var/log/messages
```
You can also delete messages in vim: `sudo vim /var/log/messages`

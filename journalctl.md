A tool that manages logfiles of `systemd`.

To delete all logs except those that were written in the last 10 hours:
```
sudo journalctl --vacuum-time=10h
```
or to delete everything except to last 2 days:
```
sudo journalctl --vacuum-time=2d
```

(the display of deleted bytes seems to be broken (it always says 0B deleted))

to view all logs:
```
journalctl
```

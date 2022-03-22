A tool that manages logfiles of `systemd`.

To delete all logs except those that were written in the last 10 hours:
```
sudo journalctl --vacuum-time=10h
```

to view all logs:
```
journalctl
```

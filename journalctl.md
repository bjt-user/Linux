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

from stackoverflow:\
*After some research I found that you can't delete logs for a specific systemd unit, because the logs are interlaced and if you delete only one unit you'll corrupt the logs, so journalctl doesn't let you.*

to view all logs:
```
journalctl
```

to view the latest logs first (reverse mode):
```
journalctl -r
```

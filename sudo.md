#### print current config

```
sudo -ll
```

## logs

#### reduce maximum size of logs

Set max number of log files to 100:
```
Defaults maxseq=100
```

#### view sudo logs

You have to pipe to `sort` because if you limit the number of logs \
the logs will be overwritten and this list is sorted by "sequence", not \
by date:
```
sudoreplay -l | sort
```

#### filter by user

```
sudoreplay -l user myuser
```

#### filter by date

```
sudoreplay -l fromdate 2025-08-06 todate 2025-08-07
```

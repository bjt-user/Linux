```
sudo dnf install wireshark
```

You need root to capture traffic:
```
sudo wireshark
```

Default time is a unix timestamp, you can configure it in `view -> time display format`


filter for ip:\
type this in the upper filter text box:
```
ip.addr == 38.145.60.21
```
and hit enter

or to filter for the `source ip`:
```
ip.src == 10.101.11.27
```

filter for the ip destination:
```
ip.dst == 10.101.11.10
```

You can also right click on an entry and select `apply filter` -> `selected`

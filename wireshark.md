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

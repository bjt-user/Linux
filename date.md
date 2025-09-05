## usage

### -d

#### show last month

By default the `-d` flag will use "now" as the starting point:
```
date -d 'last month' +%Y%m
```

But you can put a date infront of the string to use another starting point:
```
$ date -d '2025-01-10 last month' +%Y%m
202412
```

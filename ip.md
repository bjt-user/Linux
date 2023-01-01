Get your IPv4 address(es) color highlighted: (especially useful for Arch Linux because you dont have `hostname -I` there)
```
ip -4 -c addr
```

or use the `br` option for "brief" info:
```
ip -br -4 addr
```

#### parse out the ip

this still has the `/24` at the end:
```
ip -br -4 addr | grep -i "up" | awk '{print $3}'
```

this is the pure ip:
```
ip -br -4 addr | grep -i "up" | awk '{print $3}' | cut -f1 -d"/"
```

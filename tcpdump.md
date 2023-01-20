```
sudo tcpdump
```
to capture tcp traffic, can be exited with ctrl + c

you can also grep for specific traffic
```
sudo tcpdump | grep -i "bf"
```

check your interface with
```
ip addr
```

Then filter for your interface:
```
sudo tcpdump -i enp1s0
```
This is probably only useful if you have multiple interfaces, like wifi, bluetooth, ethernet etc...

Filter source:\
get your ip with `hostname -I`\
then filer for source with your ip:
```
tcpdump src [myip]
```

filer destination:
```
tcpdump dst [destination ip]
```


You can also filter for source port or destination port.

https://www.youtube.com/watch?v=1lDfCRM6dWk

#### listen on a specific port

get the interface with `ip -4 a` command

```
tcpdump -i ens192 port 61612
```


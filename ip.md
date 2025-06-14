## general info

#### installation

`ip` command is part of the `ip-route2` package and is usually preinstalled on Linux distros.


## usage

#### basic usage (most use cases)

```
ip a
```

get your IPv4 addresses:
```
ip -4 a
```

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

#### disable wifi interface

If you have a wifi module and maybe you used to connect via wifi and then switch to ethernet\
you can disable the wifi interface.\
(might not be necessary, because network might prefer ethernet anyway, but I am not sure about that)

```
ip link set wlp1s0 down
```

And now you don't see then `UP` flag in the square brackets anymore:
```
$ ip a | grep "wlp1s0"
3: wlp1s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    inet 192.168.2.222/24 brd 192.168.2.255 scope global dynamic noprefixroute wlp1s0
```

#### change ip address

This worked in a VM, but will not persist after reboot:
```
ip a change [newip] dev eth0
```

```
ip a delete [oldip] dev eth0
```

Then I could ssh into it using the new IP.

#### statistics (dropped packages)

This might help to see if there are dropped packages:
```
ip -s link show wlan0
```

There is no indication on why these packages are dropped.\
Maybe bad cable, maybe bad wifi connection, firewall?

According to this article https://www.redhat.com/en/blog/beginners-guide-network-troubleshooting-linux \
the `-s` can be used to detect problems in the physical layer (layer 1), like a bad cable.

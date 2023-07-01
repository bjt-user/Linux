----

- TOC
{:toc}

----

This seems to be the source code:

https://github.com/openbsd/src/tree/master/usr.sbin/traceroute

2 files with 1000 lines each, seems easy to compile

#### installation with package manager

```
sudo pacman -S traceroute
```

***

#### basic usage
```
traceroute google.com
```

or get the ip first
```
nslookup google.com
```
and use the ip
```
traceroute 216.58.212.174
```

#### port

```
traceroute google.com -p 22
```

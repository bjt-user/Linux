#### test ssh connectivity

```
echo 'quit' | telnet myhost 22
```

#### use timeout to come back after a couple of seconds

```
timeout 5 telnet 10.100.203.14 443
```

#### check open port WITHOUT telnet

Port open:
```
$ timeout 1 bash -c '< /dev/tcp/example.com/8080'
$ echo $?
0
```
Port closed:
```
$ timeout 1 bash -c '< /dev/tcp/example.com/8081'
$ echo $?
124
```

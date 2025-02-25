#### install and set permissions of binary

This will make sure that the binary is executable and readable:
```
$ sudo install -v -m +rx /tmp/mark /usr/local/bin/.
'/tmp/mark' -> '/usr/local/bin/./mark'
```

#### set mode with number

```
sudo install -v -m 755 mark /usr/local/bin/.
```

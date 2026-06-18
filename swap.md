#### create swapfile

https://linuxize.com/post/create-a-linux-swap-file/

Create and use a 16GB swapfile.

```
$ time sudo dd if=/dev/zero of=/swapfile bs=1024 count=16777216 status=pr
ogress
7369925632 bytes (7.4 GB, 6.9 GiB) copied, 40 s, 184 MB/s
dd: error writing '/swapfile': No space left on device
7201477+0 records in
7201476+0 records out
7374311424 bytes (7.4 GB, 6.9 GiB) copied, 40.1721 s, 184 MB/s
```

Not enough disk space...

Let's only use a 4GB swapfile.

```
time sudo dd if=/dev/zero of=/swapfile bs=1024 count=4194304 status=progress
```

```
$ ls -lh /swapfile
-rw-r-----. 1 root root 4.0G Jun 18 10:58 /swapfile
```

```
sudo chmod 600 /swapfile
```

```
sudo mkswap /swapfile
```

```
$ sudo file /swapfile
/swapfile: Linux/i386 swap file (new style), version 1 (4K pages), size 1048575 pages, no label, UUID=ced9d990-c6f1-4317-88c3-b7944ae3f1d5
```

```
sudo swapon /swapfile
```

It worked. Now I have additional 4GB of swap.

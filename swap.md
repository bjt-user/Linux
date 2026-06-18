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

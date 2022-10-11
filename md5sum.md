```
man md5sum
```

what is this???

https://www.youtube.com/watch?v=pYNuKXjcriM


#### .md5 files

.md5 files seem to just contain the checksum, which seems to be a 32 char hex number.\
And the file name of the file it belongs to.
```
$ cat myisofile.iso.md5 
3f0ae4fba42e2840c01b9eb6be02cf85 *myisofile.iso
```

#### md5sum command

the `md5sum` command prints the the checksum of the actual file you want to check.
```
$ md5sum myisofile.iso
3f0ae4fba42e2840c01b9eb6be02cf85  myisofile.iso
```

#### TODO: how to compare those two things without manually looking?

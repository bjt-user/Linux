A checksum is like the digital fingerprint of a file.

A checksum is a small-sized datum from a block of digital data for the purpose of detecting errors which may have been introduced during its transmission or storage.

md5, sha256, etc are "secure hash algorithms".

```
man md5sum
```


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

#### how to compare those two things without manually looking?

probably like this:
```
$ md5sum -c myisofile.iso.md5 
myisofile.iso: OK
```

And when you dont have the `myisofile.iso` in your directory it looks like this:
```
$ md5sum -c myisofile.iso.md5 
md5sum: myisofile.iso: No such file or directory
myisofile.iso: FAILED open or read
md5sum: WARNING: 1 listed file could not be read
```

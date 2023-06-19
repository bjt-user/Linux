```
tar -xvf filename.tar
```
eXtract Verbose File

output to a directory (that directory must exist):
```
tar -xvf file_name.tar -C /target/directory
```

#### dryrun

You may preview this process by a
```
tar tzvf filename
```
, which lists the files in the archive without actually unpacking them.

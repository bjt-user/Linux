```
tar -xvf filename.tar
```
eXtract Verbose File

output to a directory (that directory must exist):
```
tar -xvf file_name.tar -C /target/directory
```

#### show files

```
tar -tf mytar.tar
```

#### dryrun

```
tar tzvf filename
```
lists the files in the archive without actually unpacking them.

#### create tar file from directory

```
tar -cvf oracle-skripte.tar oracle-skripte
```

#### --remove-files - remove files after putting them into the archive

This will create an archive for all files with the `.bar` ending \
and then remove all those files in the dir outside the tarball:
```
tar -cvf bar.tar *.bar --remove-files
```

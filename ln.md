`man ln`

*make links between files*

There are **hard links** and **soft links**.

This creates a link named `alink` in the current directory that links to the file `hw.sh` in `/home/bf/scripts`.
```
ln -s /home/bf/scripts/hw.sh alink
```

Soft links or symbolic links seem to be used predominantly.\
I read that hard links have the disadvantage of not working across different file systems or partitions, etc.

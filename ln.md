`man ln`

*make links between files*

There are **hard links** and **soft links**.

Soft links or symbolic links seem to be used predominantly.\
I read that hard links have the disadvantage of not working across different file systems or partitions, etc.

#### create soft link / symbolic link

This creates a link named `alink` in the current directory that links to the file `hw.sh` in `/home/bf/scripts`.
```
ln -s /home/bf/scripts/hw.sh alink
```

#### view if there are soft links

A `ls -l` shows the symbolic links in the current directory through a `->`.

#### make a symlink folder

This creates the folder `newlinkfolder` in the current working directory that always has the same contents as the `/home/bf/scripts` folder.
```
ln -s /home/bf/scripts newlinkfolder
```
Note that you can't seem to make an existing folder into a symlink even when it is empty.

#### replacing an existing symlinked dir

`-f` for "force"\
`-v` for "verbose"\
`-T` to not treat the last argument as a directory
```
ln -sfvT /path/to/source/dir linkdir
```

***

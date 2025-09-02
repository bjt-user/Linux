#### search for specific file names

to show files that start with "te" and are in the current directory:
```
find . -name te*
```
If you use two asterix like this:
find . -name *te*
you need AT LEAST TWO CHARACTERS!!!
```
find . -iname *na*
```
`-i` is for ignoring case


#### redirect error spam message to /dev/null ##

```
find where-to-look criteria action 2>/dev/null
```
```
find . -iname "data*.txt" -print 2>/dev/null
```

#### search through file contents

https://stackoverflow.com/questions/16956810/how-do-i-find-all-files-containing-specific-text-on-linux#16957078

This seems to work quite well:
```
grep -rnw '/path/to/somewhere/' -e 'pattern'
```
Or use `.` as a path for the current directory.

Sometimes you get `permission denied`, `Input/Output error`, or `invalid argument` though.

- -r or -R is recursive,
- -n is line number, and
- -w stands for match the whole word.

#### sort the output of find

this seems to sort by creation or modification timestamp:
```
find /archive -iname "*Gts_automatic_correction_statement_*" -printf "%T+ %p\n" | sort
```

#### find large files

```
sudo find . -xdev -type f -size +100M
```

#### find directories

find all directories in the current directory:
```
find . -type d
```

search for dirs starting with an `m` in the current dir:
```
$ find . -type d -name "m*"
./man
./m
./misc
./menu
./doc/html/man
```

To exclude subdirectories you can use `-maxdepth 1`:
```
find . -maxdepth 1 -type d
```

To exclude the dir in which to search itself: `-mindepth 1`

#### only search for files

```
find . -type f -name myfilename.csv
```

#### find files that were moved or modified in the last xx days

```
find . -type f -mtime -14
```

#### -delete

To show successfully deleted files add `-print` to the command:
```
find /tmp -iname "*.txt" -type f -delete -print
```

#### deleting old files (dumps, logs)

deleting logs who were not modified in the last 90 days
```
find /var/log/my_application/ -type f -mtime +90 -exec rm -f {} \; >/dev/null 2>&1
```
You might want to put something like this in your crontab.

Delete all files with a modify timestamp from 2024:
```
find . -type f -newermt 2024-01-01 ! -newermt 2025-01-01 -delete
```

#### count number of files in a directory recursively

Find all files in a directory and all its subdirectories:
```
find . -type f | wc -l
```

#### exclude files with specific name

```
sudo find ~ -type d -name "*vim*" ! -name "neo*"
```

This will only exclude `neo*` in the basename of files, not inside the path.

### ownership

#### find files that are owned by a specific user

```
find . -type f -user root
```

#### find files that are NOT owned by a specific user

```
find . ! -user tomcat
```

#### find files that have no group attached

When a group was given a new id or was deleted, the files owned by that group \
will not be attached to any group but are still owned by a specific group id.

Find files that are not owned by any existing group:
```
find . -nogroup
```

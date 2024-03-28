## search for specific file names

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


## redirect error spam message to /dev/null ##

```
find where-to-look criteria action 2>/dev/null
```
```
find . -iname "data*.txt" -print 2>/dev/null
```

## search through file contents

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

## sort the output of find

this seems to sort by creation or modification timestamp:
```
find /archive -iname "*Gts_automatic_correction_statement_*" -printf "%T+ %p\n" | sort
```

## find large files

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

***

#### only search for files

```
find . -type f -name myfilename.csv
```

#### find files that were moved or modified in the last xx days

```
find . -type f -mtime -14
```

#### deleting old files (dumps, logs)

deleting logs who were not modified in the last 90 days
```
find /var/log/my_application/ -type f -mtime +90 -exec rm -f {} \; >/dev/null 2>&1
```
You might want to put something like this in your crontab.

#### count number of files in a directory recursively

Find all files in a directory and all its subdirectories:
```
find . -type f | wc -l
```

#### find files that are owned by a specific user

```
find . -type f -user root
```

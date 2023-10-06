#### sorting after the second column

```
$ cat tosort.txt
col1    col2
first   06:11
second  06:06
third   06:07
fourth  05:07

$ sort -k 2 tosort.txt

fourth  05:07
second  06:06
third   06:07
first   06:11
col1    col2
```

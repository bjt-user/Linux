#### split file after x lines

to make files that are each 100 lines long: (or to split after 100 lines if the file is shorter than 200 lines)
```
$ wc -l config 
186 config
$ split -l 100 config 
$ ls -la
total 16
drwxr-xr-x. 1 myuser mygroup   24 Oct 20 09:42 .
drwxr-xr-x. 1 myuser mygroup  904 Oct 20 09:24 ..
-rw-r--r--. 1 myuser mygroup 6708 Oct 20 09:25 config
-rw-r--r--. 1 myuser mygroup 3572 Oct 20 09:42 xaa
-rw-r--r--. 1 myuser mygroup 3136 Oct 20 09:42 xab
$ wc -l xaa
100 xaa
$ wc -l xab
86 xab
```

#### output file name

```
split -l 153 myfile outputfile
```
Then there will be output files like this:
```
outputfileaa
outputfileab
outputfileac
```

***

#### split by size of a file
```
$ split -n2 config 
$ ls -la
total 16
drwxr-xr-x. 1 myuser mygroup   24 Oct 20 09:31 .
drwxr-xr-x. 1 myuser mygroup  904 Oct 20 09:24 ..
-rw-r--r--. 1 myuser mygroup 6708 Oct 20 09:25 config
-rw-r--r--. 1 myuser mygroup 3354 Oct 20 09:31 xaa
-rw-r--r--. 1 myuser mygroup 3354 Oct 20 09:31 xab
$ wc -l config 
186 config
$ wc -l xaa 
93 xaa
$ wc -l xab
93 xab
```
(that the files have the same number of lines seems to be a coincidence)

So
```
split -n2 filename
```
will split a file in the middle and create two files which are the same size in bytes

(I noticed, that it did split a comment in half, so it really splits after size of a file not after lines)

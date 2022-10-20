Split a file in half
```
$ split -n2 config 
myuser:~/Coding/scripts/tmp $ ls -la
total 16
drwxr-xr-x. 1 myuser mygroup   24 Oct 20 09:31 .
drwxr-xr-x. 1 myuser mygroup  904 Oct 20 09:24 ..
-rw-r--r--. 1 myuser mygroup 6708 Oct 20 09:25 config
-rw-r--r--. 1 myuser mygroup 3354 Oct 20 09:31 xaa
-rw-r--r--. 1 myuser mygroup 3354 Oct 20 09:31 xab
myuser:~/Coding/scripts/tmp $ wc -l config 
186 config
myuser:~/Coding/scripts/tmp $ wc -l xaa 
93 xaa
myuser:~/Coding/scripts/tmp $ wc -l xab
93 xab
```
(that the files have the same number of lines seems to be a coincidence)

So
```
split -n2 filename
```
will split a file in the middle and create two files which are the same size in bytes

(I noticed, that it did split a comment in half)

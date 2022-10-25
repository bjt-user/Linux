```
man cat
```

cat - concatenate files and print on the standard output

#### concatenate files

this will concatenate two files and print the output to stdout:
```
$ cat file_one.txt file_two.txt 
```

to save it in a file instead of stdout:
```
$ cat file_one.txt file_two.txt > file_one_and_two.txt
```

***

#### see tabs of a file
```
cat -T filename
```

#### print line endings of a file
```
$ cat -A file_one.txt 
## File 1$
$
Dies ist File 1.$
$
***$
$
```

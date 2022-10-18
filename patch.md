```
man patch
```

You can generate a diff file with `diff` and then make `patch` apply it.

```
diff -u compare1.txt compare2.txt > difffile.txt
patch < difffile.txt
```

After that the files compare1.txt and compare2.txt are the same.


But modifying the diff file is not that easy, because you will destroy the format if you don't also change the line numbers in the diff file.

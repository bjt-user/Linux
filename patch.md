```
man patch
```

You can generate a diff file with `diff` and then make `patch` apply it.

You can modify the diff file before applying it to only make the changes you want.

```
diff -u compare1.txt compare2.txt > difffile.txt
patch < difffile.txt
```

After that the files compare1.txt and compare2.txt are the same.

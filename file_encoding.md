use
```
file -i myfile.txt
```
to check encoding.

It looks like it is `ascii` if there are no special characters, and `utf-8` if there are special characters liek `&, ß, ä, ö`.

```
$ cat test.txt 
Wie ist das File Encoding in dieser Datei?
&ßÄÜÖ
$ file -i test.txt
test.txt: text/plain; charset=utf-8
```

```
$ cat keine_umlaute.txt 
just some english text without special characters
$ file -i keine_umlaute.txt 
keine_umlaute.txt: text/plain; charset=us-ascii
```
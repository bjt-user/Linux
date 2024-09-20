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

#### iconv

Converting from one encoding to another might sometimes work with `iconv`.\
Does not seem to be possible to convert from any encoding to another.\
Or `file -i` will only show the new encoding if it has special characters in it.\
Otherwise it probably will show `us-ascii`.

#### convert file to different encoding

From `utf-8` to `iso-8859-1`:
```
iconv -f utf-8 -t iso-8859-1 myfile.sql -o myfile.sql
```
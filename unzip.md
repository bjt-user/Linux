#### how to unzip to a folder

```
unzip zippedstuff.zip -d myfolder
```

#### print file content to stdout

```
unzip -p myfile.zip
```

#### extract multiple files with wildcards

For some reason wildcards need to be escaped with a backslash:
```
unzip -p \*.zip
```

Or use double quotes:
```
unzip "*foobar*.zip"
```

#### always overwrite files

May be useful in scripts.

`-o`

#### never overwrite files

May be useful in scripts.

`-n`

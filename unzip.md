#### how to unzip to a folder

```
unzip zippedstuff.zip -d myfolder
```

#### print file content to stdout

```
unzip -p myfile.zip
```

#### wildcards

For some reason wildcards need to be escaped with a backslash:
```
unzip -p \*.zip
```

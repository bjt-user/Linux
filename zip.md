#### installation

```
sudo pacman -S zip
```

#### create zip file

```
zip -r foo.zip test.txt test1.txt
```

#### print contents of zip file

```
$ zip -sf foo.zip
Archive contains:
  test.txt
  test1.txt
Total 2 entries (12 bytes)
```

#### unzip file

This is a different application:
```
sudo pacman -S unzip
```

```
unzip foo.zip
```

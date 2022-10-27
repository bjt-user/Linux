awk is good for working with data that is arranged in columns.\
a space is usually the deliminator for every column.

#### columns

print only the first column of something:
```
ls -la | awk '{ print $1 }'
```

to also omit the first line (header):
```
ls -la | awk '{ print $1 }' | tail -n +2
```

***

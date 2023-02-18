awk is good for working with data that is arranged in columns.\
a space is usually the deliminator for every column.

#### print columns

print only the first column of something:
```
ls -la | awk '{ print $1 }'
```

to also omit the first line (header):
```
ls -la | awk '{ print $1 }' | tail -n +2
```

print multiple columns:
```
who -b | awk '{ print $3, $4 }'
```
***

#### print rows

Print the second column of the **second row**:
```
awk 'FNR == 2 {print $2}'
```
***

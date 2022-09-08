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

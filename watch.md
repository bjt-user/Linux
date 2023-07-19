```
watch -d -n 5 bash /path/to/my/script
```

How to watch piped commands?

```
watch 'command | othertool | yet-another-tool'
```

The same works for commands that are put together by `&&`

For example you can run simple c programs with this
```
watch 'gcc hw.c && ./a.out'
```
and change the source in a second window

## bugs

#### ps output

I noticed that some processes were missing when doing a
```
watch 'ps -ef | grep -i "myprocess"'
```
that were always present in a normal
```
ps -ef | grep -i "myprocess"
```
output.

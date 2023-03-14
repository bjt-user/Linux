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

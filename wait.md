#### wait until a process is done

```
wait [pid]
```

```
$ sleep 20 &
[1] 709
$ pgrep -af 'sleep'
709 sleep 20
$ wait 709
[1]+  Done                    sleep 20
```
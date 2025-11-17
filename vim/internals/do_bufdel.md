#### wipe the current buffer

This similar to what happens when `:bw` is called:
```
do_bufdel(DOBUF_WIPE, NULL, 0, 0, 0, 1);
```

But `:bw` seems to call `ex_bunload`.

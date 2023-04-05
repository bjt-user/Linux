dmesg - print or control the kernel ring buffer

With human readable timestamps:
```
dmesg -T
```

Be aware that the timestamp could be inaccurate! The time source used for the logs is not updated after system SUSPEND/RESUME.\
Timestamps are adjusted according to current delta between boottime and monotonic clocks, this works only for messages printed after last resume.

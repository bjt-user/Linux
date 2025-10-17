#### 0x10 (MODE_INSERT)

```
#define MODE_INSERT 0x10    // Insert mode, also for Replace mode
```

#### 0x1001 (MODE_NORMAL_BUSY)

Which state is this:
```
(gdb) p/x State
$9 = 0x1001
```

It is `MODE_NORMAL_BUSY`:
```
#define MODE_NORMAL_BUSY (0x1000 | MODE_NORMAL)
```
As `MODE_NORMAL` is:
```
#define MODE_NORMAL 0x01
```

The `|` (binary OR) operation works like this: \
1 or 0 -> 1 \
0 or 0 -> 0 \
0 or 0 -> 0 \
0 or 1 -> 1

In decimal it is 4097:
```
(gdb) p State
$10 = 4097
```

```
ping google.com
```
will send 64 bytes infinatelly every second until you end the process with `ctrl + c`.

```
ping -c 3 google.com
```
will only send 64 bytes three times.

#### proxy

`ping` does **not** work behind a proxy.

#### Where to set the PATH




## FAILS

**WARNING: NEVER DO THIS**\
I set the path in `/etc/environment` and the whole system is now garbage because no commands work anymore.

Maybe try to set the `PATH` to a different value again.

Have to go with the full path of the executable files to make it work again:
```
/usr/bin/vim /etc/environment
```

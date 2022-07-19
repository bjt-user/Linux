#### Where to set the PATH

It can be set in infinite places but where do you set it so it does not break everything else and works even for the root user?

Or do you have to set it for every user and the root user in `.bashrc`



## FAILS

**WARNING: NEVER DO THIS**\
I set the path in `/etc/environment` and the whole system is now garbage because no commands work anymore.

Maybe try to set the `PATH` to a different value again.

Have to go with the full path of the executable files to make it work again:
```
/usr/bin/vim /etc/environment
```

But the question is why this does not work?

I think the problem was that I did not put a `shebang` at the beginning of the file and the `$PATH` was not recognized as a variable.\
=> nope it still doesnt work


- `etc/profile`
it says I should create a custom.sh shell script in `/etc/profile.d/`:
```
# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.
```

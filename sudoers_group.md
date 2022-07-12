#### adding a user to the sudoers group/file

In `/etc` there is a file called `sudoers`.

Be root (`su`).\
You can do `visudo` as root or do `vim /etc/sudoers` to open the file (but that is readonly).

We use the `visudo` command since it performs sanity checks before the file is saved so as to avoid breaking the sudoers file.\
Traditionally, the visudo command uses the vi editor. But on Ubuntu, the default editor is changed to nano.

To make `visudo` open the file in vim do this:
```
sudo update-alternatives --config editor
```

So I add the user `myuser` to the sudoers group like this:
```
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
myuser  ALL=(ALL)       ALL
```
(note that there is a `tab` after `root`)\
=> and that worked.



#### wheel group

A more modern way seems to be to just add a user to the `wheel` group.\
But this seems to be more a Fedora way, Ubuntu has `adm` and `sudo` group.

```
usermod -aG wheel <myuser>
```

type
```
id
```
to see in which groups you are.


#### sudo without typing the password

```
sudo visudo
```

Then comment out the line for the `sudo` group.\
And add the line like this:
```
#%sudo	ALL=(ALL:ALL) ALL
%sudo ALL=(ALL) NOPASSWD: ALL
```
(you don't need tabs, one space between words is enough)

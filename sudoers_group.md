#### adding a user to the sudoers group/file

In `/etc` there is a file called `sudoers`.

Be root (`su`).\
You can do `visudo` as root or just do `vim /etc/sudoers` to open the file.

We use the `visudo` command since it performs sanity checks before the file is saved so as to avoid breaking the sudoers file.\
Traditionally, the visudo command uses the vi editor. But on Ubuntu, the default editor is changed to nano.

So I add the user `myuser` to the sudoers group like this:
```
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
myuser  ALL=(ALL)       ALL
```
(note that there is a `tab` after `root`)\
=> and that worked.



#### wheel group

A more modern way seems to be to just add a user to the `wheel` group.

```
usermod -aG wheel <myuser>
```

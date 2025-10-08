#### log vim session to a file

This will create the file 'foo.log' if it doesnt exist and log to it:
```
:call ch_logfile('foo.log', 'w')
```
If the file already exists it will overwrite the content.\
(You can use "a" to append.)

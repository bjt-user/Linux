```
tee test.txt << EOF
```
Then you can enter text.\
After your last line, type `EOF`.\
And everything will be saved into `test.txt`.

Seems to work better than `cat >> test.txt` because then you need to press `<ctrl+d>` to send the `end of file` which does not work in every terminal.

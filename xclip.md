```
sudo apt install xclip
```

copy to the clipboard
```
cat test.txt | xclip
```

see what is in xclip (does only work for things you piped into xclip not for the entire clipboard):
```
xclip -o
```

This is said to only work in `x` applications. (xorg applications?) \
Did not work in firefox or gedit...only in terminal.

If you want to copy into other applications (for example firefox):
```
cat file | xclip -selection clipboard
```

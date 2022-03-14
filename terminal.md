#### Useful shortcuts and tricks while entering commands in a terminal

*these work in Debian*

Jumping a word back/forward while entering commands in the terminal:\
ctrl + arrowkeys *(does not work in Putty)*\
or\
alt + f -> to move one word forward\
alt + b -> to move one word backwards

Go to the beginning of the line:\
ctrl + a

To delete from the cursor position to the end of the line:\
ctrl + k

to delete everything from cursor position to the beginning of the line:\
ctrl + u

to delete one word (space delimited) backwards:\
ctrl + w

to yank the text back you just deleted:\
ctrl + y

to switch two words (space separated) around:\
alt + t


***

Opening a terminal that is not part of the GUI:\
ctrl + alt + F3

Going back to GUI:\
ctrl + alt + F2

***

Execute the previous command:
```
!!
```

Is helpful if you forgot to type sudo before a command.\
Then just type
```
sudo !!
```

***

to view files on the command line that are bigger than one screen (and maybe when you don't have vi or vim installed) you can use less.
```
less textfile.txt
```

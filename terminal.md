#### Useful shortcuts and tricks while entering commands in a terminal

*these work in Debian*

Jumping a word back/forward while entering commands in the terminal:\
ctrl + arrowkeys *(does not work in Putty)*\
or\
alt + f -> to move one word forward\
alt + b -> to move one word backwards

ctrl + f -> move one character forward\
ctrl + b -> move one character back

Go to the beginning of the line:\
ctrl + a

To delete from the cursor position to the end of the line:\
ctrl + k

to delete everything from cursor position to the beginning of the line:\
ctrl + u

to delete one word (space delimited) backwards:\
ctrl + w

to delete the character at cursor position:\
ctrl + d\
(only works if there is something to delete, otherwise it will terminate the shell)

to delete the character in front of the cursor (backspace):\
ctrl + h

to yank the text back you just deleted:\
ctrl + y

to switch two words (space separated) around:\
alt + t

to go back and forth in history (without using arrowkeys):\
ctrl + p\
ctrl + n

the equivalent to <enter> (executes a command):\
ctrl + m

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

to search the history:\
ctrl + r\
(then once you find something you can hit ctrl + r again to go through multiple commands)

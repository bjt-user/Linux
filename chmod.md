chmod [option] file

the [option] can be a three numbers.\
three numbers from 0-7.

the numbers come from binary system.\
000 \
rwx \

read only would be: 100\
which is 4 in decimal. (0+0+4)

read and execute would be: 101\
which is 5 in decimal. (1+0+4)

read and write would be: 110\
which is 6 in decimal. (0+2+4)

every permission is: 111\
which is 7 in decimal. (1+2+4)

there are three blocks of permissions you can view with `ls -la`.

give everyone every permission for the file `startup.sh`
```
sudo chmod 777 startup.sh
```

But for which user or user group do the numbers stand for?\
`man 1 chmod` says
> A numeric mode is from one to four octal digits (0-7), derived by adding up the bits with values 4, 2, and 1.  Omitted digits are assumed to be leading zeros.  The first digit selects the  set  user ID  (4)  and  set group ID (2) and restricted deletion or sticky (1) attributes.  The second digit selects permissions for the user who owns the file: read (4), write (2), and execute (1); the third
selects permissions for other users in the file's group, with the same values; and the fourth for other users not in the file's group, with the same values.

It seems to be the case that most people ommit the first digit and use three digits.\
So then you should have
1. digit: permissions for the user who owns the file
2. digit: permissions for the group of the user who owns the file (the `man` file says it different, but idk)
3. digit: permissions for other users who are not in the group of the user who owns the file

***

you can also use a different system to grant permissions

u: user\
g: group\
o: others\
a: all

-/+

r: read\
w: write\
x: execute

for example:
```
chmod u+x file
```
give user permission to execute the file

#### directory permissions

If you give the current folder 666 permissions you cant read it anymore
```
$ chmod 666 .
$ ls -la
ls: cannot open directory '.': Permission denied
``` 
which is weird because 666 should be read and write for everyone

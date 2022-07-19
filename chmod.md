chmod [option] file

the [option] can be a three numbers.\
three numbers from 0-7.

the numbers come from binary system.\
000 \
rwx \

read only would be: 100\
which is 4 in decimal. (0+0+4)

every permission is: 111\
which is 7 in decimal. (1+2+4)

there are three blocks of permissions you can view with `ls -la`.

give everyone every permission for the file `startup.sh`
```
sudo chmod 777 startup.sh
```

### ENVIRONMENT VARIABLES

To see all environment variables:
```
env
```

To set an environment variable:
```
set MYVAR=EXAMPLE
```
To remove an environment variable:
```
unset MYVAR
```
***
### PATH
#### show the path

The `PATH` is used to call binaries without the complete path from any directory.\
Show the `PATH`:
```
echo $PATH
```
***
#### set the path
There are different ways to set the `PATH`.\
To temporarily add a binary to the `PATH` just type 
```
export PATH=$PATH:/home/myuser/opt/myprogram/bin
```

You can put that line into your `.bashrc` or `.bash_profile`, etc. for a permanent solution.

But a cleaner way is to adjust the `PATH` here:
```
sudo vim /etc/profile
```


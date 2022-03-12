Too see all environment variables:
```
env
```

#### PATH

The `PATH` is used to call binaries without the complete path from any directory.\
Show the `PATH`:
```
echo $PATH
```


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


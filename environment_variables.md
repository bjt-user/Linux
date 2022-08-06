### ENVIRONMENT VARIABLES

To see all environment variables:
```
env
```

To set an environment variable:
```
export MYVAR=EXAMPLE
```
To remove an environment variable:
```
unset MYVAR
```
search for specific environment variable:
```
env | grep MYVAR
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

You can put that line into your `.bashrc` or `.bash_profile`, etc. for a permanent solution.\
`bash -s` to source `.bashrc` and make the environment variables take effect.

another way is to adjust the `PATH` here:
```
sudo vim /etc/profile
```

or in `/etc/environment`

but what is the correct way to do it, so that also the root user has this path?\
and not only the normal user.

If you put something in `/etc/environment` you need to use the shebang at the beginning of the `environment` file.

#### troubleshooting

putting this into `/etc/environment` destroys the entire PATH:
```
export PATH=$PATH:/usr/lib/jvm/java-17-openjdk-17.0.3.0.7-2.el8_6.x86_64/bin
```

Usually you dont want to do a `su` to login as root, you want to do `su -`!\
That is a big difference:
```
-, -l, --login
              Start the shell as a login shell with an environment similar to a real login:

                 o      clears all the environment variables except TERM and variables specified by --whitelist-environment

                 o      initializes the environment variables HOME, SHELL, USER, LOGNAME, and PATH

                 o      changes to the target user's home directory

                 o      sets argv[0] of the shell to '-' in order to make the shell a login shell
```
***

#### run command as another user

```
su -c "touch /home/myuser/generated_through_script.txt" myuser
```
***

#### TODO: run command block as another user

```
su somebody <<'EOF'
command1 -p 'parameter with "quotes" inline'
command2 -p 'parameter with "quotes" inline'
command3 -p 'parameter with "quotes" inline'
EOF
```
***

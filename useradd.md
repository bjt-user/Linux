```
adduser -m -s /bin/bash -g users bofo
```
This way you add a user.\
`-m` means that a `home` folder for the user will be created.\
`-s` specifies the standard shell for the user.\
`-g` means the group of the user.

You can add a password with `-p` but it is not recommended, because the password (or encrypted password) will be visible by users listing the processes.

But when I do a `su - bofo` with the root user I cannot set a password with `passwd` because it asks for the current password.

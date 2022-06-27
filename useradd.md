```
useradd -m bf -s /bin/bash -g users bf
```
This way you add a user.\
`-m` means that a `home` folder for the user will be created.\
`-s` specifies the standard shell for the user.\
`-g` means the group of the user.

#### setting a password for the user

You can add a password with `-p` but it is not recommended, because the password (or encrypted password) will be visible by users listing the processes.

Fail: But when I do a `su - bf` with the root user I cannot set a password with `passwd` because it asks for the current password.

=> Be root (`su`) and type `passwd bf`. Then you won't be asked for the current password and can change the password instantly.

#### get information about a user

```
id <username>
```

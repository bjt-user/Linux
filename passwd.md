## usage

#### change your password

To change your password type `passwd` and then type in the new password \
two times.

#### check if a user has a password set

```
sudo passwd -S my_user
```
If the second column contains a "P" there is a password set.\
If the second column contains an "L" there is no password set.

> The second field indicates if the user account has a locked password (L), \
has no password (NP), or has a usable password (P).

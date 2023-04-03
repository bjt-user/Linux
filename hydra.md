#### installation

```
sudo dnf install hydra
```

#### resources

https://github.com/vanhauser-thc/thc-hydra

***

#### try trivial ssh passwords

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

#### bruteforcing without a password list

**This will take around 55 days just to bruteforce a password with 4 lowercase letters**

And finally, there is a bruteforce mode with the -x option (which you can not
use with -p/-P/-C):

```
-x minimum_length:maximum_length:charset
```

the charset definition is `a` for lowercase letters, `A` for uppercase letters,
`1` for numbers and for anything else you supply it is their real representation.
Examples:

```
-x 1:3:a generate passwords from length 1 to 3 with all lowercase letters
-x 2:5:/ generate passwords from length 2 to 5 containing only slashes
-x 5:8:A1 generate passwords from length 5 to 8 with uppercase and numbers
```

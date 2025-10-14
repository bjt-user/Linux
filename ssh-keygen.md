#### give the public key another comment
```
ssh-keygen -f /tmp/id_ed25519 -t ed25519 -C gitlab-ansible
```

Your public key will look like this:
```
$ cat id_ed25519.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAicKaMiI3WvIt4QDr/rDuPRgYrOLoCBXQxn9oFVuWxFl7 gitlab-ansible
```

#### generate public key from private key

```
ssh-keygen -y -f id_ed25519
```

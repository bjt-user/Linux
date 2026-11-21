## usage

#### copy public key to remote server

```
ssh-copy-id -i id_ed25519.pub user@server
```
Now type in the password of `user`.

And now the public key is in `user`'s `authorized_keys`.

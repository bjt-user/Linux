## general info

```
man ssh_config
```

## usage

#### local command

This will execute a command on the remote host as soon as you are logged in.

```
Host my_host
        HostName my-hostname.com
        User %u
        PermitLocalCommand true
        LocalCommand sudo -i -u %
```

Init scripts are in `/etc/init.d`.

#### how to automatically start a service at boot time?

Put it in `/etc/rc.local` (which is a symlink to `/etc/rc.d/rc.local`)

You need to run this command:
```
chmod +x /etc/rc.d/rc.local
```

put this in it `/etc/rc.local`
```
/etc/init.d/tomcat start
```

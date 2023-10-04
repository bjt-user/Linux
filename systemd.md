## unit files

You can see the location of a systemd unit file with the `systemctl status <unit>` command.

`/etc/systemd/system` is for custom unit files

`/lib/systemd/system` contains a lot of unit files

### setting environment variables

You can set them inside the unit file or use an environment file.

#### setting environment variables in the unit file itself
```
Environment=JAVA_HOME=/usr/java/openjdk-11.0.2
```

#### environment file

This worked for using an environment file that contains environment variables for the application:
```
# cat /etc/systemd/system/wildfly.service
[Unit]
Description=The WildFly Application Server

[Service]
EnvironmentFile=/etc/wildfly/environment.conf
ExecStart=/opt/wildfly/bin/standalone.sh --debug

[Install]
WantedBy=multi-user.target
```

The environment file may not contain `export` statements:
```
# cat /etc/wildfly/environment.conf
JAVA_HOME=/usr/java/openjdk-11.0.2
JAVA_OPTS="-Dcpbs.config.path=/path/to/a/config/dir"
```

When using spaces in environment variable you need to use double or single quotes:
```
Environment='JAVA_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,address=*:12346,server=y,suspend=n'
```

#### TODO: limit number of restart tries

You might not want a service to try to restart over and over again if it will always fail.\
Because that will fill up your logs and it might be harder to find the reason of failure.

>To allow a maximum of 5 retries separated by 30 seconds use the following options in the relevant systemd service file.

```
[Unit]
StartLimitInterval=200
StartLimitBurst=5

[Service]
Restart=always
RestartSec=30
```

>Note that StartLimitInterval must be greater than RestartSec * StartLimitBurst otherwise the service will be restarted indefinitely.\
The service is considered failed when restarted StartLimitBurst times within StartLimitInterval.

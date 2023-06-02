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

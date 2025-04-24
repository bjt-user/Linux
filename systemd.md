## general

#### documentation

Useful manpages:
- man 5 systemd.unit
- man 5 systemd.service
- man systemd.target
- man systemd.kill
- man systemctl

```
man 5 systemd.unit
```

Interesting sections:

```
[UNIT] SECTION OPTIONS
```

```
SPECIFIERS
```

```
man 5 systemd.service
```

interesting sections:
```
Restart=
```

## unit files

You can see the location of a systemd unit file with the `systemctl status <unit>` command.

`/etc/systemd/system` is for custom unit files

`/lib/systemd/system` contains a lot of unit files

to open a specific unit file with your `$EDITOR` you can also just do:
```
systemctl edit --full tomcat-n26.service
```

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

#### limit number of restart tries (StartLimitBurst, StartLimitIntervalSec)

`man 5 systemd.unit` (l. 660)

> StartLimitIntervalSec=interval, StartLimitBurst=burst \
Configure unit start rate limiting.\
Units which are started more than burst times within an interval time span \
are not permitted to start any more.

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

#### RestartSec

`man 5 systemd.service`:

> RestartSec=
Configures the time to sleep before restarting a service (as configured with Restart=).\
Takes a unit-less value in seconds, or a time span value such as "5min 20s". Defaults to 100ms.

#### Restart

`man 5 systemd.service` (l. 438):

> Takes one of no, on-success, on-failure, on-abnormal, on-watchdog, on-abort, or always.

> If set to no (the default), the service will not be restarted.

> If set to on-failure, the service will be restarted when the process exits with a non-zero exit code,\
is terminated by a signal (including on core dump, but excluding the aforementioned four signals),\
when an operation (such as service reload) times out, and when the configured watchdog timeout is triggered.

> If set to on-abnormal, the service will be restarted when the process is terminated by a signal\
(including on core dump, excluding the aforementioned four signals), when an operation times out,\
or when the watchdog timeout is triggered.

> If set to on-abort, the service will be restarted only if the service process\
exits due to an uncaught signal not specified as a clean exit status.

> If set to on-watchdog, the service will be restarted only if the watchdog timeout for the service expires.

> If set to always, the service will be restarted regardless of whether it exited cleanly or not,\
got terminated abnormally by a signal, or hit a timeout.\
Note that Type=oneshot services will never be restarted on a clean exit status,\
i.e. always and on-success are rejected for them.

#### removing units

To remove service `foo`:

```
rm -fv /etc/systemd/system/multi-user.target.wants/foo.service
rm -fv /etc/systemd/system/foo.service
```

```
sudo systemctl daemon-reload
```

Now they should not show up anymore:
```
systemctl list-units --all | grep "foo"
```

### useful specifiers

`%N` for the unit name.

## target files

WARNING: custom targets are dangerous and can make your system not boot with \
ssh anymore.

### get default target

From what I have read this is the target that the system boots into:
```
$ systemctl get-default
multi-user.target
```

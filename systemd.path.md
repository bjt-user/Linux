## general

#### about

Monitor files or directories and trigger a service when something has changed.

#### documentation

```
man systemd.path
```

## usage

#### foo.path

Create a file called `foo.path` in `/etc/systemd/system`.

In the `[Path]` Section you can specify a
```
Unit=
```
which will be triggered.

Use `PathModified=` when you want to trigger when a file was modified.

## general

#### about

Monitor files or directories and trigger a service when something has changed.

You need to `start` the unit so that it start monitoring \
it needs to be active.

#### documentation

```
man systemd.path
```

## usage

#### PathModified

This works for monitoring single files as well as directories.

## examples

#### foo.path

Create a file called `foo.path` in `/etc/systemd/system`.

In the `[Path]` Section you can specify a
```
Unit=
```
which will be triggered.

Use `PathModified=` when you want to trigger when a file was modified.

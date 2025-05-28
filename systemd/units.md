#### validate units

```
systemd-analyze verify /etc/systemd/system/your_unit.service
```

On errors return code is still 0...\
So it cant be used in CI/CD.

In recent version it might work with `--recursive-errors=MODE`.

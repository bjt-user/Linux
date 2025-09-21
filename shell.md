#### which shell are you in?

There is an env var, but that is not always set.

To see the type of shell you are currently using:
```
echo $0
```

Or use the env var that doesnt always exist:
```
echo $SHELL
```
usually outputs
```
/bin/bash
```
(maybe not all systems have that environment variable)

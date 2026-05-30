## general info

#### installation

```
sudo pacman -S expect
```

#### documentation

```
man expect
```

> In general, Expect is useful for running any program which requires \
interaction between the program and the user.

## syntax

#### spawn

Spawn a program with cli args:
```
spawn uname -r
```

The output seems to only show when an `expect` command follows.

## general info

https://github.com/sharkdp/fd

Written in Rust.

```
sudo pacman -S fd
```

## usage

#### general syntax

```
fd [OPTIONS] [pattern] [path]
```

#### find files and dirs in a dir that match a regex

The search pattern is treated as a regular expression.

`sudo` is the search pattern here and `/etc` is the path:
```
fd sudo /etc
```

#### find files with the exact name in a dir

```
fd -g sudo /etc
```

#### find all regular files in a dir

This will only show regular files (except hidden and .gitignored files):
```
fd -tf
```

#### find all files with a specific extension

```
fd -e yaml
```

#### exec (execute commands on files)

The `-x`/`--exec` option runs an external command for each of the search results (in parallel).

The `-X`/`--exec-batch` option launches the external command once, with all search results as arguments.

#### find all zip files and unzip them

```
fd -e zip -x unzip
```

#### find all yaml files and open them in vim

```
fd -e yaml -X vim
```

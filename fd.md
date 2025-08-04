## general info

https://github.com/sharkdp/fd

Written in Rust.

```
sudo pacman -S fd
```

## usage

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

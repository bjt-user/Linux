## how to compile vim?

`src/INSTALL`

```
To build Vim on Ubuntu from scratch on a clean system using git:
        Install tools required to be able to get and build Vim:
        % sudo apt install git
        % sudo apt install make
        % sudo apt install clang
        % sudo apt install libtool-bin

        Build Vim with default features:
        % git clone https://github.com/vim/vim.git
        % cd vim/src
        % make

        Run tests to check there are no problems:
        % make test
```

`libtool` might be this pacman package:
```
core/libtool
```

```
cd src
```

```
time make -j$(nproc)
```
10 seconds on a fast modern thinkpad with 6 cores. (with debug flags)

## compile and install

```
git clone https://github.com/vim/vim
```

```
cd src
```

```
make -j$(nproc)
```

```
sudo make install
```

## enabling/disabling features

You might need to
```
make distclean
```
and
```
make clean
```
before running `./configure`.

```
./configure --help
```

#### compile without wayland

```
./configure --without-wayland
```

```
make -j$(nproc)
```

```
sudo make install
```

# how to compile vim?

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

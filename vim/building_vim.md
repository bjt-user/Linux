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

## attempts

#### first try

```
cd src
time make
```

```
real	2m28.565s
user	2m17.496s
sys	0m8.077s
```

```
$ echo $?
0
```

```
$ ./vim
failed to load colors/lists/default.vim
Error detected while processing /home/myuser/.vimrc:
line   22:
E185: Cannot find color scheme 'default'
line   31:
E484: Can't open file /usr/local/share/vim/syntax/syntax.vim
```

But the editor opens, it works.

```
make test
```

```
TEST FAILURE
make[1]: *** [Makefile:53: report] Error 1
make[1]: Leaving directory '/home/my_user/workspace/git/third_party/vim/src/testdir'
make: *** [Makefile:2224: scripttests] Error 2

real	5m10.135s
user	2m16.501s
sys	0m31.553s
```

Multiple tests have failed.\
But the CI has also failed atm in `main`, so it might be normal.

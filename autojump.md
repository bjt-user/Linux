https://github.com/wting/autojump

A program that learns from your `cd` commands.\
And even when you do `!` from `nnn`.\
So it knows which folders you visit frequently and you can jump to it easily with the `j` command and just the first letters of that folder name.

### installation

#### fedora 36

```
sudo dnf install autojump
```

But if you install from a package manager the `j` command is not available by default.

```
$ dnf repoquery -l autojump
...
/etc/profile.d/autojump.sh
/usr/bin/autojump
/usr/lib/python3.10/site-packages/__pycache__/autojump_data.cpython-310.opt-1.pyc
/usr/lib/python3.10/site-packages/__pycache__/autojump_data.cpython-310.pyc
/usr/lib/python3.10/site-packages/__pycache__/autojump_match.cpython-310.opt-1.pyc
/usr/lib/python3.10/site-packages/__pycache__/autojump_match.cpython-310.pyc
/usr/lib/python3.10/site-packages/__pycache__/autojump_utils.cpython-310.opt-1.pyc
/usr/lib/python3.10/site-packages/__pycache__/autojump_utils.cpython-310.pyc
/usr/lib/python3.10/site-packages/autojump_data.py
/usr/lib/python3.10/site-packages/autojump_match.py
/usr/lib/python3.10/site-packages/autojump_utils.py
/usr/share/autojump
/usr/share/autojump/autojump.bash
/usr/share/autojump/icon.png
/usr/share/doc/autojump
/usr/share/doc/autojump/AUTHORS
/usr/share/doc/autojump/README.md
/usr/share/licenses/autojump
/usr/share/licenses/autojump/LICENSE
/usr/share/man/man1/autojump.1.gz
```

You have to put this into ~/.bashrc:
```
source /usr/share/autojump/autojump.bash
```

#### Ubuntu

```
sudo apt install autojump
```

put this in your bashrc:
```
source /usr/share/autojump/autojump.bash
```

#### arch linux

there is no `autojump` package in pacman...

There is an AUR though:\
https://aur.archlinux.org/packages/autojump

=> that worked

#### install.py fail

```
sudo -i
cd /opt
git clone https://github.com/wting/autojump.git
cd autojump
python3 install.py
```

It says:
```
Please manually add the following line(s) to ~/.bashrc:

	[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
```

Restarted terminal and still `j: command not found`....

Maybe this is because I installed it as `root`....

#### manual install 2

```
sudo pacman -S python3
```

```
sudo git clone https://github.com/wting/autojump.git /opt/autojump
```

```
cd /opt/autojump/bin
sudo cp autojump autojump_argparse.py autojump_data.py autojump_match.py autojump_utils.py /usr/local/bin/.
```

The file you need to source in your bashrc is `/opt/autojump/bin/autojump.bash`.\
=> Ive put this into my dotfiles

=> works

#### usage

for your cd behavior statistics:
```
autojump -s
```

```
j scr
```
to jump into a frequently used folder in `~/Coding/scripts`

## troubleshooting

#### no module named 'autojump_argparse'

```
$ autojump -s
Traceback (most recent call last):
  File "/usr/bin/autojump", line 39, in <module>
    from autojump_argparse import ArgumentParser
ModuleNotFoundError: No module named 'autojump_argparse'
```

The problem was that I was using
```
$ python --version
Python 3.11.3
```
but the packages for autojump were in this directory:
```
autojump /usr/lib/python3.10/site-packages/autojump_argparse.py
autojump /usr/lib/python3.10/site-packages/autojump_data.py
autojump /usr/lib/python3.10/site-packages/autojump_match.py
autojump /usr/lib/python3.10/site-packages/autojump_utils.py
```

So I copied these 4 files over to `/usr/lib/python3.11/site-packages/`.\
This fixed the problem.

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

#### manual install fail

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

#### usage

for your cd behavior statistics:
```
autojump -s
```

```
j scr
```
to jump into a frequently used folder in `~/Coding/scripts`

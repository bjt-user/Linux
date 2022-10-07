https://github.com/wting/autojump

#### installation

fail:
```
sudo dnf install autojump
```

But if you install from a package manager the `j` command is not available by default.

=> no idea how to enable it, so you better install manually

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

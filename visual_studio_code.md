## installation

#### Ubuntu/Debian

https://code.visualstudio.com/docs/setup/linux

> Installing the .deb package will automatically install the apt repository \
and signing key to enable auto-updating using the system's package manager.

https://code.visualstudio.com/Download

```
sudo apt install ./<file>.deb
```

***

#### settings config file

I found `settings.json` at:
```
~/.config/Code/User/settings.json
```

put this in your bashrc or bash_profile:
```
alias codesettings='vim ~/.config/Code/User/settings.json'
```

#### open in full screen

I added the `"window.restoreFullscreen": true` line at the bottom:
```
{
    "security.workspace.trust.untrustedFiles": "open",
    "vim.vimrc.path": "/home/bf/.vimrc",
    "vim.vimrc.enable": true,
    "vim.leader": ",",
    "redhat.telemetry.enabled": false,
    "extensions.ignoreRecommendations": true,
    "window.newWindowDimensions": "fullscreen",
    "window.restoreFullscreen": true
}
```

=> then start vs code, go into full screen, exit and open it up again => it now starts in full screen

#### workspace trust

`trust` seems to be just annoying, you can disable `workspace trust` like this (or in the settings inside vscode):
```
"security.workspace.trust.enabled": false
```

#### disable update notification

put this in your `~/.config/Code/User/settings.json`
```
"update.mode": "none"
```

#### extensions

```
code --list-extensions
```


Settings for extensions: <kbd>ctrl</kbd>+<kbd>,</kbd> to open general settings\
=> extensions => click your Extension\
(note that your extension has to be enabled to show up in the settings)

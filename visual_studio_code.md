#### settings config file

I found `settings.json` at:
```
~/.config/Code/User/settings.json
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
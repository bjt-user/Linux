I noticed `vscode` (also sometimes named `code`) made my pc fan aggressive.\
Even though `vscode` wasn't running in the foreground anymore.

This command seemed to solve this problem:
```
killall code
```
(seems to kill all processes related to `vscode`)

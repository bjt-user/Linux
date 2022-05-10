#### kill processes

I noticed `vscode` (also sometimes named `code`) made my pc fan aggressive.\
Even though `vscode` wasn't running in the foreground anymore.

This command seemed to solve this problem:
```
killall code
```
(seems to kill all processes related to `vscode`)

#### view processes

a lot of people just do
```
ps -ef
```
to view all running processes. (but you don't see the date and time when the process was started)

This shows the start date and time of all the processes:

```
ps -eo pid,lstart,cmd
```

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
to view all running processes.\
You can see the date and time when the processes were started in the column `STIME`.\
It seems to show the time if the process was started today and month+day if the process was not started today.

This shows the start date and time of all the processes in a nicer way:
```
ps -eo pid,lstart,cmd
```

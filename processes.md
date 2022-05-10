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

This shows the start date and time of all the processes in a more detailled way:
```
ps -eo pid,lstart,cmd
```

#### ps options

`man ps`
```
-f     Do full-format listing. This option can be combined with many other UNIX-style options to add additional columns.  It also causes the command arguments to be printed.
When used with -L, the NLWP (number of threads) and LWP (thread ID) columns will be added.  See the c option, the format keyword args, and the format keyword comm.
```
```
-e     Select all processes.  Identical to -A.
```

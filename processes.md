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
(it is a formatted way of viewing the processes, you the process id (`pid`), the start date and time (`lstart`), and the command the process was started with (`cmd`))

```
ps -eo pid,lstart,cmd
```
seems to also show the state of the processes, unfortunatelly only abbreviated

#### ps options

`man ps`
```
-f     Do full-format listing. This option can be combined with many other UNIX-style options to add additional columns.
It also causes the command arguments to be printed.
When used with -L, the NLWP (number of threads) and LWP (thread ID) columns will be added.
See the c option, the format keyword args, and the format keyword comm.
```
```
-e     Select all processes.  Identical to -A.
```
```
-o format
User-defined format.
format is a single argument in the form of a blank-separated or comma-separated list, which offers a way to specify individual output columns.
The recognized keywords are described in the STANDARD FORMAT SPECIFIERS section below.
Headers may be renamed (ps -o pid,ruser=RealUser -o comm=Command) as desired.
If all column headers are empty (ps -o pid= -o comm=) then the header line will not be output.
Column width will increase as needed for wide headers; this may be used to widen up columns such as WCHAN (ps -o pid,wchan=WIDE-WCHAN-COLUMN -o comm).
Explicit width control (ps opid,wchan:42,cmd) is offered too.
The behavior of ps -o pid=X,comm=Y varies with personality; output may be one column named "X,comm=Y" or two columns named "X" and "Y".
Use multiple -o options when in doubt.
Use the PS_FORMAT environment variable to specify a default as desired; DefSysV and DefBSD are macros that may be used to choose the default UNIX or BSD columns.
```

How to run a command in the background
--------------------------------------

Add the ampersand symbol `&` at the end of the command:
```
command &
```
Then press `<enter>` to get back to the command prompt.

=> this only works well for processes that don't produce any output to the terminal.\
A process that prints to terminal will still print that to the terminal and interrupt your session.

You need to use this
```
nohup ./whileecho.sh &
```
to redirect the output to a file named nohup.out.\
And your session will not be interrupted anymore.

#### show jobs

Use the jobs utility to display the status of all stopped and background jobs in the current shell session:
```
jobs -l
```
or if you don't need the second number in front of the job (no idea what it is for) just type:
```
jobs
```

To bring a background process to the foreground, use the fg command:
```
fg
```
If you have multiple background jobs, include % and the job ID after the command
```
fg %1
```

to kill a job
```
kill %[jobid]
```
But then the job is still listed as `terminated` in `jobs` command for some time.\
And then disappears after a few seconds.\
=> but it does not always work, I wanted to kill a `stopped` process but nothing happened.
```
kill -9 [jobid/processid]
```
This command killed it!

#### to test: disown

Start a job in the background and then type.

```
disown %[jobid]
```
And then that process should still be there even after closing the terminal.\
But you will not find it in the `jobs` list.

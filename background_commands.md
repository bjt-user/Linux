How to run a command in the background
--------------------------------------

Add the ampersand symbol `&` at the end of the command:
```
command &
```
Then press `<enter>` to get back to the command prompt.


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
kill [jobid]
```
But then the job is still listed as `terminated` in `jobs` command for some time.\
And then disappears after a few seconds.

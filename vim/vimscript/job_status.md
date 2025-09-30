## general info

```
job_status({job})                                       job_status() E916
Returns a String with the status of {job}:
"run"   job is running
"fail"  job failed to start
"dead"  job died or was stopped after running
```

## examples

#### sleep example

```
vim9script

var sleep_job = job_start(['sleep', '5'])

echo sleep_job

while job_status(sleep_job) == "run"
        sleep 1
endwhile

echo job_status(sleep_job)
```
outputs (sleeps 5 seconds in between the lines)
```
process 2511 run
dead
```

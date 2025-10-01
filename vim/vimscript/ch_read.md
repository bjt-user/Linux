## examples

#### timeout

This works for a script that sleeps for 2 seconds and then \
writes to stdout:
```
vim9script

var my_job = job_start(['./sleep_and_echo.sh'])

var result = ''

echo typename(my_job)

try
        result = ch_read(my_job, {'timeout': 4000})
catch
        result = 'job failed'
endtry

echo result
```

If you dont define a timeout or have the timeout below 3000 milliseconds \
an empty string will be returned from ch_read().

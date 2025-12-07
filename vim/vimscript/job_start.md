## general info

#### return type

`job`

#### useful options

See `:h job-options`

`drop`: `never` (allows reading from dead jobs) \
`mode`: `raw` (does not stop reading at new lines) \
`timeout`: 5000 (waiting for 5 seconds for the job to finish) \
`'err_io': 'out'` (stderr messages to go to stdout)

With `timeout` you do not need a sleep loop to wait until the job has finished.

Setting `err_io` to `out` is useful because if the command fails \
the error message will be printed in the status line of vim.\
Without it it will only show "not an open channel".

## examples

#### read from shell job

```
vim9script

var my_job = job_start(['cat', '/etc/os-release'], {'drop': 'never', 'mode': 'raw'})

var output = ''

output = ch_read(my_job)

echo 'output: ' .. output
```

## general info

#### return type

`job`

#### useful options

`drop`: `never` (allows reading from dead jobs) \
`mode`: `raw` (does not stop reading at new lines) \
`timeout`: 5000 (waiting for 5 seconds for the job to finish)

With `timeout` you do not need a sleep loop to wait until the job has finished.

## examples

#### read from shell job

```
vim9script

var my_job = job_start(['cat', '/etc/os-release'], {'drop': 'never', 'mode': 'raw'})

var output = ''

output = ch_read(my_job)

echo 'output: ' .. output
```

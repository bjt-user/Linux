## examples

#### get channel from job

```
vim9script

var my_job = job_start(['./bar.sh'])

var my_channel = job_getchannel(my_job)

echo my_channel
sleep 1
echo my_channel
sleep 1
echo my_channel
sleep 1
echo my_channel
sleep 1
echo my_channel
sleep 1
```
outputs:
```
channel 0 open
channel 0 open
channel 0 open
channel 0 open
channel 0 closed
```

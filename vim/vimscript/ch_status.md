## general info

```
ch_status({handle} [, {options}])                               ch_status()
Return the status of {handle}:

"fail"          failed to open the channel
"open"          channel can be used
"buffered"      channel can be read, not written to
"closed"        channel can not be used
                {handle} can be a Channel or a Job that has a Channel.

"buffered" is used when the channel was closed but there is still data that can be obtained with ch_read().
If {options} is given it can contain a "part" entry to specify the part of the channel
to return the status for: "out" or "err".
For example, to get the error status:                                                                                                           ch_status(job, {"part": "err"})                                                                                                                                                                                                                                                         Can also be used as a method:                                                                                                                           GetChannel()->ch_status()

Return type: String
```

## examples

#### execute ch_status on a job

No need to get the channel from a job to get the channel status:
```
vim9script

var my_job = job_start(['sleep', '2'])

echo ch_status(my_job)
sleep 1
echo ch_status(my_job)
sleep 1
echo ch_status(my_job)
sleep 1
echo ch_status(my_job)
sleep 1
```
outputs:
```
open
open
open
closed
```

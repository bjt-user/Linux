## fails

#### no output

You can see that there is an open channel with `ch_info()`, but there is no result:
```
vim9script

var doc_job = job_start(['ansible-doc', '-j', '-t', 'keywords', '-l'])

var doc_channel = job_getchannel(doc_job)

echo ch_info(doc_channel)

var result = ch_read(doc_channel)

echo result
```

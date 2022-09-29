#### make curl ignore the proxy

If your curl is at least version 7.19.4:
```
curl --noproxy '*' https://www.google.com
```


#### no output?

```
curl https://www.bloomberg.com/markets/stocks
```
has no output

this does have an output:
```
curl -L https://www.bloomberg.com/markets/stocks
```

According to stackoverflow this is because this website is only accessible via https.\
(which is weird because that should be most sites today)\
https://stackoverflow.com/questions/17732137/curl-get-request-returns-no-output

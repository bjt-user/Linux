#### make curl ignore the proxy

If your curl is at least version 7.19.4:
```
curl --noproxy '*' https://www.google.com
```

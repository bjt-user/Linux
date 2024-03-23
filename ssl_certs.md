#### arch linux - adding ssl cert

This worked:
```
sudo trust anchor --store mycert.pem
```

After that the curl that previously failed with a self-signed cert problem worked.

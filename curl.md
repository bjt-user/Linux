#### make curl ignore the proxy

If your curl is at least version 7.19.4:
```
curl --noproxy '*' https://www.google.com
```

***

Save output to file:
```
curl -L https://www.bloomberg.com/markets/stocks -o bloomberg-stocks.html
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


#### silent

Sometimes there is a statusbar in curl.\
That shows how much and how fast was downloaded.\
In scripts I turn that off with the silent option:
```
curl -s https://www.bild.de
```

#### read email

I could list all my folder names with this command in `Debian Sid`:
```
curl --url 'imaps://imap.web.de/' --user 'username:password'
```
So reading from the mail server seemed to be successful, if nothing was cached.

You can specify the folder like this in the URL: `imaps://imap.web.de/Klamotten`\
If you add `--request 'FETCH 1:* (BODY[])'` at the end you will see IDs of all emails in that folder.

I managed to successfully retrieve an email with this command:
```
curl "imaps://username:password@imap.web.de/INBOX/;MAILINDEX=1"
```
(and that seemed to be the oldest email in the inbox folder)

***
***
***

#### good websites to curl

get weather information:
```
curl wttr.in/Berlin
```

get your public ip address:
```
curl ipinfo.io/ip
```
this is probably your public ipv6:
```
curl ifconfig.co
```

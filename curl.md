https://en.wikipedia.org/wiki/List_of_HTTP_status_codes

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

`-L` is "follow redirects"

#### follow redirects

```
curl -L https://someurl.com
```

#### silent

Sometimes there is a statusbar in curl.\
That shows how much and how fast was downloaded.\
In scripts I turn that off with the silent option:
```
curl -s https://www.bild.de
```

#### verbose

`-v` or `--verbose`.\
This should show more detailed information like proxy settings used or information about ssl negotiation.
```
curl -vI https://www.google.com
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

You can get more hints here:\
https://www.rfc-editor.org/rfc/rfc3501

This will retrieve all email subjects and dates in that folder:
```
curl --url 'imaps://imap.web.de/Klamotten' --user 'username:password' --request 'FETCH 1:* (ENVELOPE)'
```

This will retrieve the uids/MAILINDEX which can be given as the mailindex parameter as seen above:
```
curl --url 'imaps://imap.web.de/Klamotten' --user 'username:password' --request 'FETCH 1:* (UID)'
```

this gives mailindex and date:
```
curl --url 'imaps://imap.web.de/Klamotten' --user 'username:password' --request 'FETCH 1:* (UID INTERNALDATE)'
```

#### send email (SUCCESS)

This actually worked: (from web.de account to gmail account)
```
curl -v --ssl-reqd --url 'smtps://smtp.web.de:465' --user 'my.name@web.de:password' --mail-from 'my.name@web.de' --mail-rcpt 'receiver@gmail.com' --upload-file email.txt
```
You need an email file that is formatted like this:
```
From: "My Name" <my.name@web.de>
To: "Receiver" <receiver@gmail.com>
Subject: an example.com example email

Dear Joe,
Welcome to this example email. What a lovely day.
```

Do **NOT** include the `Date: ` field as shown on the curl website, as that will lead to 554 error.

It worked with Linux line endings as well as with Windows line endings.

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

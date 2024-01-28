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
curl --url 'imaps://imap.web.de/my_folder' --user 'username:password' --request 'FETCH 1:* (ENVELOPE)'
```

This will retrieve the uids/MAILINDEX which can be given as the mailindex parameter as seen above:
```
curl --url 'imaps://imap.web.de/my_folder' --user 'username:password' --request 'FETCH 1:* (UID)'
```

this gives mailindex and date:
```
curl --url 'imaps://imap.web.de/my_folder' --user 'username:password' --request 'FETCH 1:* (UID INTERNALDATE)'
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

From gmail to web.de you need an app password:
```
534-5.7.9 Application-specific password required. Learn more at
< 534 5.7.9  https://support.google.com/mail/?p=InvalidSecondFactor
```

## set headers with your request

Some sites will not let you curl them without a "user agent" header:
```
$ curl https://www.nasdaq.com/market-activity/stocks/msft
<HTML><HEAD>
<TITLE>Access Denied</TITLE>
</HEAD><BODY>
<H1>Access Denied</H1>
 
You don't have permission to access "http&#58;&#47;&#47;www&#46;nasdaq&#46;com&#47;market&#45;activity&#47;stocks&#47;msft" on this server.<P>
Reference&#32;&#35;18&#46;ecc4dd58&#46;1688493270&#46;1774b026
</BODY>
</HTML>
```

this worked:
```
curl -H "User-Agent: Mozilla/5.0 Firefox/115.0" https://www.nasdaq.com/market-activity/stocks/msft
```
You can look what headers Firefox sends in the web developer tools (<kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>i</kbd>)\
network tab -> (refresh site again if not all GET requests are shown) -> click on a row and look at the "header section" on the right\
at the bottom you see "user agent"

But in this case it does not help much because you need to execute client side javascript to get useful data, which is not possible with curl.

#### -k / --insecure | trust unsecure https connections

To resolve this error:
```
curl: (60) SSL certificate problem: self signed certificate in certificate chain
More details here: https://curl.haxx.se/docs/sslcerts.html

curl failed to verify the legitimacy of the server and therefore could not
establish a secure connection to it. To learn more about this situation and
how to fix it, please visit the web page mentioned above.
```

```
curl -k -L --noproxy '*' https://my-local-site.lo
```

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

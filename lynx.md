```
sudo apt install lynx

lynx -accept_all_cookies
```

<kbd>Q</kbd> to quit

But the cookies dont seem to work:
```
lynx -accept_all_cookies https://www.bloomberg.com/markets/stocks
```
I still cant get past the cookie page...

> Lynx doesn't support Javascript.


https://stackoverflow.com/questions/9353519/lynx-with-javascript

> I'd strongly recommend you look at using Selenium or another browser automation package.

#### testing web apps

lynx can be useful to test web applications and render html in the cli:
```
lynx -dump http://192.168.49.2:32448
```

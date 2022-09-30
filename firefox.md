#### show full url (with `http://` or `https://`)

Type `about:config` in the address bar.

Type `browser.urlbar.trimURLs` in the search bar and toggle to `false`.

***

### view cookies
#### method 1
The cookies are in the folder `~/.mozilla/firefox/4x2i7rym.default-release` \
(but the last folder will probably differ on every machine, it is the profile folder)

The cookies are stored in a sqlite db, but it is locked when you still have Firefox running.\
=> close Firefox first

```
sqlite3 cookies.sqlite
```

(it is easier to view it in `sqlitebrowser`)

The column `host` has the base urls in it `.stackoverflow.com`

#### method 2

press <kbd>ctrl + shift + i</kbd> \
or click on the three lines at the upper right corner -> more tools -> Web Developer Tools 

click on the `storage` ribbon and click on `cookies` at the left hand side\
expand it by clicking on the arrow and click on the hostname

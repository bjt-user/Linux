#### show full url (with `http://` or `https://`)

Type `about:config` in the address bar.

Type `browser.urlbar.trimURLs` in the search bar and toggle to `false`.

***

#### see cookies

The cookies are in the folder `~/.mozilla/firefox/4x2i7rym.default-release` \
(but the last folder will probably differ on every machine, it is the profile folder)

The cookies are stored in a sqlite db, but it is locked when you still have Firefox running.\
=> close Firefox first

```
sqlite3 cookies.sqlite
```

(maybe it is easier to view it in `sqlitebrowser`?)

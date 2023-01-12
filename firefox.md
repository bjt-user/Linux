#### show full url (with `http://` or `https://`)

Type `about:config` in the address bar.

Type `browser.urlbar.trimURLs` in the search bar and toggle to `false`.

#### disable firefox cache loading

To not load sites from the cache anymore do this:

```
about:config
```

`browser.cache.check_doc_frequency` auf 1 setzen

from stackexchange:

For reference, valid values for browser.cache.check_doc_frequency are:

    0 – Check for a new version of a page once per session (a session starts when the first application window opens and ends when the last application window closes).

    1 - Check for a new version every time a page is loaded. ← This one

    2 – Never check for a new version – always load the page from cache. (offline mode?)

    3- Check for a new version when the page is out of date. (Default)

Obviously this will affect your entire browsing experience, but it's this or CTRL + F5 a few times.

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

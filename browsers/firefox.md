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
#### backup bookmarks

https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data?redirectslug=Profiles&redirectlocale=en-US

three lines -> help -> more troubleshooting information\
-> application basics -> profile directory

```
~/.mozilla/firefox/4x2i7rym.default-release $ sqlite3 places.sqlite
SQLite version 3.40.0 2022-11-16 12:10:08
Enter ".help" for usage hints.
sqlite> .tables
moz_anno_attributes                 moz_keywords                      
moz_annos                           moz_meta                          
moz_bookmarks                       moz_origins                       
moz_bookmarks_deleted               moz_places                        
moz_historyvisits                   moz_places_metadata               
moz_inputhistory                    moz_places_metadata_search_queries
moz_items_annos                     moz_previews_tombstones
```

You can see the labels of your bookmarks:
```
select * from moz_bookmarks;
```
But you dont see the corresponding URLs in clear text. Might be encrypted.

You can copy over `places.sqlite` to another users profile.\
But you have to make sure that the permissions are correct.

```
sudo chown myuser:myuser places.sqlite
```

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


## troubleshooting

https://support.mozilla.org/en-US/kb/fix-bookmarks-and-history-will-not-be-functional

=> do a
```
sudo chown myuser:myuser places.sqlite
```

***

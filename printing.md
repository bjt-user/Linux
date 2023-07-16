Standard **port** for most printers seems to be `9100`.

To initialize a printer you first have to use "CUPS".

```
sudo pacman -S cups
```

if the cups service is active
```
systemctl status cups
```
you should be able to access 
```
http://localhost:631/
```
in a browser.\
Administration => Manage Printers   - shows all your printers that you have configured

Various commands that might help, when printing doesn't work:
`lpq`       - seems to show the printing schedule of the default printer\
`lpstat`    - shows all printing jobs\
`lpstat -s` - shows the default printer (destination)\
`lp example.pdf`              - prints the document example.pdf with the default printer\
=> this did not work for a `.mbox` file\
`cancel yourprinter-14`       - cancels a print jobs that is shown in "lpstat" (where "yourprinter-14" is in the first column of a lpstat prompt)

***
#### printing mbox html emails

I encountered problems when printing emails from Evolution in a `.mbox` format.\
When trying to print the email from Evolution it said "printer not found".\
`lp example.mbox` prints the email but not in a human readable way.\
Seems to be a file with some kind of `html` stuff in it.\
I can't open it in Firefox however.

I renamed the file to `example.html` and then typed
```
firefox example.html
```
and it was displayed and it was correctly rendered but it had some ugly characters at the start and end.\
So i used `vim` to delete everything up to `<DOCTYPE HTML...>` then did `firefox example.html` and printed it from firefox.

TODO: next time write a bash script that does the renaming and deleting.

To initialize a printer you first have to use "CUPS".
(there are youtube tutorials how to do it)
Type 
```
http://localhost:631/
```
in a browser.

Various commands that might help, when printing doesn't work:
`lpq`       - seems to show the printing schedule of the default printer\
`lpstat`    - shows all printing jobs\
`lp example.pdf`              - prints the document example.pdf\
`cancel yourprinter-14`       - cancels a print jobs that is shown in "lpstat" (where "yourprinter-14" is in the first column of a lpstat prompt)

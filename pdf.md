## reading pdf

#### browser

You can read pdfs in Firefox

#### zathura

```
zathura debugging_with_gdb.pdf
```
<kbd>j/k</kbd> to scroll\
<kbd>J/K</kbd> next page/previous page\
<kbd>+/-</kbd> zoom in/out

`:500` - go to page 500\
`:bmark mystring` - set a bookmark for the current page with the label `mystring`\
`:blist` - list all bookmarks\
`:bdelete mystring` - delete bookmar named `mystring`

#### Merge PDFs

pdfunite example1.pdf example2.pdf example3.pdf output.pdf

#### Redaction

Open pdf in gimp -> Paintbrush -> then export with *.pdf ending.
Seems like you can only do this with one page at a time.

#### Cropping

```
sudo apt-get install texlive-extra-utils
```

```
pdfcrop --margins "-600 -450 0 0" input.pdf output.pdf
```

(see `pdfcrop --help`)
(`--margins "<left> <top> <right> <bottom>"                    (0 0 0 0)`)

TODO: Play around with python pdf libs.

## useful tools

- pdfarranger (Helps merge or split PDF documents and rotate, crop and rearrange pages)

## reading pdf

#### browser

You can read pdfs in Firefox

#### zathura

https://wiki.archlinux.org/title/Zathura

```
sudo pacman -S zathura
```
But you also need to install a plugin to read pdfs.

```
sudo pacman -S zathura-pdf-mupdf
```

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

or with `pdfarranger`:
```
sudo pacman -S pdfarranger
```
This is a graphical tool that is able to crop pdfs.

#### converting image to pdf

```
convert myimage.jpg myimage.pdf
```

***
TODO: Play around with python pdf libs.

## ghostscript

#### view pdf file

```
gs -dSAFER -dBATCH  Anschreiben_Bjoern_Foersterling.html.pdf
```

#### render postscript file to pdf

```
ps2pdf helloworld.ps
```

#### postscript hello world file

```
$ cat helloworld.ps
%!PS
/Palatino-Roman 20 selectfont
300 400 moveto
(Hello, World!) show
showpage
```

#### convert pdf file to postscript

```
pdf2ps myfile.pdf
```

That produced a `.ps` file with over 10000 lines.

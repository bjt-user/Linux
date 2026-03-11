## general info

https://en.wikipedia.org/wiki/PDF#

## useful tools

- pdfarranger (Helps merge or split PDF documents and rotate, crop and rearrange pages)

## inspecting pdfs

The `poppler` package has a tool called `pdfinfo`.

```
$ pdfinfo example.pdf
Producer:        pdfjs v2.4.7 (github.com/rkusa/pdfjs)
CreationDate:    Sun Apr 14 09:04:25 2024 CEST
Custom Metadata: no
Metadata Stream: no
Tagged:          no
UserProperties:  no
Suspects:        no
Form:            none
JavaScript:      no
Pages:           1
Encrypted:       no
Page size:       2475.12 x 1914 pts
Page rot:        0
File size:       1839651 bytes
Optimized:       no
PDF version:     1.6
```

The "Page size" is especially interesting.\
A lot of pdfs have A4 format (`595 x 841 pts (A4)`).\
If you merge pdfs with different page sizes together it can have weird \
side effects.

## reading pdf / pdfviewer

#### browser

You can read pdfs in Firefox

#### zathura

[see zathura.md](zathura.md)

#### evince

TODO

## editing pdfs

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

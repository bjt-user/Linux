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

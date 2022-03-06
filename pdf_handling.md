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
pdfcrop --margins "400 400 0 0" input.pdf output.pdf
```

=> does **not** work, the `pdf` just gets smaller

TODO: Play around with python pdf libs.

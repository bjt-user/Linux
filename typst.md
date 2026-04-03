## general info

Files seem to have the `.typ` ending.

#### installation

```
sudo pacman -S typst
```

## usage

#### compile to pdf

```
typst compile foo.typ
```
will generate a `foo.pdf`.

## syntax

#### math formulas

https://typst.app/docs/reference/math/

```
$a, b in { 1/2, sqrt(4 a b) }$

$f(x) = a - b / (c^2)$
```

#### table of contents

It is possible to create an automatic toc:
```
#outline()
```

So that headings are automatically numbered you need this:
```
#set heading(numbering: "1.")
#outline()
```

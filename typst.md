## general info

Files seem to have the `.typ` ending.

Playground: https://typst.app/play/

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

#### open in viewer

Open output in `zathura`:
```
typst compile my_thesis.typ --open zathura
```

#### show all fonts

```
typst fonts
```

## syntax

#### comments

```
/*
a comment
*/
```

or single line:
```
// a comment
```

#### title

https://typst.app/docs/reference/model/title/

```
#set document(
  title: [My Bachelor Thesis]
)

#title()
```

Change the size and alignment:
```
#set document(
  title: [My Bachelor Thesis]
)

#show title: set text(size: 40pt)
#show title: set align(center)

#title()
```
(https://typst.app/docs/tutorial/advanced-styling/)

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

#### pagebreak

https://typst.app/docs/reference/layout/pagebreak/

End the page.

```
#pagebreak()
```

#### page

https://typst.app/docs/reference/layout/page/

You should be able to change the page size as described.

###### show page numbers

```
#set page(
  numbering: "1 / 1",
)
```

#### cite

https://typst.app/docs/reference/model/cite/

> Before you starting citing, you need to add a bibliography somewhere in your document.

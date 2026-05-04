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

#### declaring variables

```
#let my_var = "hello"
```

You can then use `my_var` in other constructs.

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

#### headings

```
== This is a header level 2
```

#### math formulas

https://typst.app/docs/reference/math/

```
$a, b in { 1/2, sqrt(4 a b) }$

$f(x) = a - b / (c^2)$
```

###### plus minus sign

`plus.minus` when you are between dollar signs.

###### multiplication sign

The `*` looks more like a star than a multiplication sign.

You can also use `dot`.

#### box around math

Be sure to set `inset` to a big enough value as that is the space between \
the box content and the border.
```
#box(
  stroke: 1pt,
  inset: 8pt,
  [$root(n, a/b) = root(n, a)/root(n, b)$],
)
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

#### linebreak

Use `\`.

For an empty line:
```
\
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

###### set margin

> auto: The margins are set automatically to 2.5/21 times the smaller dimension of the page.\
This results in 2.5 cm margins for an A4 page.

You can use `pt` or `cm` as unit.
```
#set page(
  margin: 5pt,
)
```

#### cite

https://typst.app/docs/reference/model/cite/

> Before you starting citing, you need to add a bibliography somewhere in your document.

#### set font for the rest of the document

```
#set document(
  title: "It's me.",
)

#set text(
  font: "DejaVu Sans Mono",
)

#title()
```

For multiple fonts:
```
#set text(
  font: "DejaVu Sans Mono",
)
This is DejaVu Sans Mono.

#set text(
  font: "FreeMono",
)
This is FreeMono.
```

#### underline

https://typst.app/docs/reference/text/underline/

```
This is #underline[important].
```

Make the underline gray and 2pt big and have an offset between the text und the line of 2pt:
```
#set underline(
  stroke: 2pt + gray,
  offset: 2pt,
)
```

#### table

https://typst.app/docs/reference/model/table/

```
#table(
  columns: (auto, auto, auto),
  table.header(
    [Name], [Age], [Gender]
  ),
  [John Doe], [44], [male],
  [Peter Smith], [55], [male],
)
```

You can also use double quotes instead of the square brackets.

The `columns` parameter sets the column sizes and the number of columns.

#### block

A block of text with a gray background:
```
#block(
  fill: gray,
  inset: 8pt,
  [Date of birth: 8 Aug 1989 |
  Phone number: +49 1515 7437271],
)
```

#### padding

Have some white space around your text.\
Especially useful if you have set the page margin to 0.
```
#pad(
  x: 20pt,
  lorem(100),
)
```

#### symbols

Supported symbols:\
https://typst.app/docs/reference/symbols/sym/

#### colors

https://typst.app/docs/reference/visualize/color/

###### predefined colors

```
black	luma(0)
gray	luma(170)
silver	luma(221)
white	luma(255)
navy	rgb("#001f3f")
blue	rgb("#0074d9")
aqua	rgb("#7fdbff")
teal	rgb("#39cccc")
eastern	rgb("#239dad")
purple	rgb("#b10dc9")
fuchsia	rgb("#f012be")
maroon	rgb("#85144b")
red	rgb("#ff4136")
orange	rgb("#ff851b")
yellow	rgb("#ffdc00")
olive	rgb("#3d9970")
green	rgb("#2ecc40")
lime	rgb("#01ff70")
```

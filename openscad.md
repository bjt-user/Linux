https://openscad.org/cheatsheet/

#### using external editor

https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_an_external_Editor_with_OpenSCAD

Make sure the following two settings are enabled:

Design->Automatic Reload and Preview

View->Hide editor

---

Variablen deklarieren:
my_variable = 120;

cube([2,3,4]);

Produziert ein viereckiges Objekt. (Länge, Breite, Höhe)

F5 drücken um Vorschau zu sehen.
F6 drücken zum rendern.

Linke Maustaste gedrückt halten und Maus bewegen um die Perspektive zu ändern.
Rechte Maustaste gedrückt halten und Maus bewegen um die Position im 3d View zu ändern.
Mausrad gedrückt halten und Maus bewegen zum Zoomen.
Mausrad drehen zoomt auch, jedoch verändert sich auch die Skala.

ctrl + i  -  indent
ctrl + shift + i  -  unindent

cylinder(r=5,h=6);

Zylinder mit Radius 5 und Höhe 6.

Ein "%" vor einem Objekt macht es durchsichtig.

Folgender Code bewegt einen Zylinder um 4 Stellen nach vorne, hinten, oben:
translate([4,4,4]) {
    cylinder(2, 1.5, 3);
}

## FILLETS

$fn=40;

platelength=40;
platewidth=10;
plateheight=4;
filletradius=2;

minkowski() {
cube(
[platelength-filletradius*2,
platewidth-filletradius*2,
plateheight/2]);

translate([filletradius,filletradius,0]) {
  cylinder(plateheight/2,
    filletradius,
    filletradius);
  }
}

Die Minkowski-Funktion ist eine komplexe mathematische Funktion.
Unter anderem addiert sie die Dimensionen der beiden Objekte die verbunden werden.
Daher muss der Zylinder etwas in das Rechteck hineingeschoben werden und 
vom Rechteck wieder jeweils die zweifache Verschiebung abgezogen werden.
Verschiebung ist hier gleich des Zylinderradius.

=> funktioniert aber nicht immer, z.B. bei sehr dünnen Rechtecken, z.B. wenn man so Wände erzeugen will.

## MODULES

Modules work like functions or methods in programming.
```
module name ( parameters ) {
actions
}
```

to use a module from another file in your file put this at the beginning:
```
use <rounded_rect.scad>
```

## Including or using code from different files

include <filename> acts as if the contents of the included file were written in the including file, and
use <filename> imports modules and functions, but does not execute any commands other than those definitions.

(before including/using make sure you save your file in the same folder as the file you want to include/use)

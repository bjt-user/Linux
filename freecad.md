#### Wie positioniert man Kreise in einem Rechteck? (Löcher positionieren)

1. Den Kreis auf das Rechteck irgendwo hinmachen
1. Den Mittelpunkt des Kreises und den Mittelpunkt des Rechtecks auswählen
1. ctrl + h (horizontales Constraint)
1. Constraint einstellen (z.B. 2mm horizontaler Abstand vom Mittelpunkt des Rechtecks)
1. ctrl + v (vertikales Constraint)
1. Constraint einstellen (z.B. 2mm vertikaler Abstand vom Mittelpunkt des Rechtecks)

Durch Doppelklick auf die 2mm kann man das Constraint jederzeit verändern.

Achtung: "Conflicting Constraints" können vorkommen, wenn man übersieht, dass schon ein Constraint an der Stelle war.


=> In der Pad-Ansicht, waren die Löcher schon automatisch "gebohrt".


Neues Problem: Der Kreis auf dem Rechteck war nicht sichtbar.
=> Lösung, das Rechteck war über dem Kreis und hat das Rechteck verdeckt.
Ich habe das Rechteck um 180° gedreht und den Kreis von unten gezeichnet.
Wenn es dann immer noch verdeckt ist, ein bisschen drehen mit middle mouse button und right mouse button.
(3dimensionales Drehen = erst mittlere Maustaste gedrückt halten, dann rechte Maustaste gedrückt halten)
Dann Sketch beendet und irgendwie auf "Hole" Button und dann "through all" auswählen und "ok".

=> geschicktere Lösung: nach dem Erstellen des Sketches den Button "switches between section and full view" klicken, dann sieht man den Kreis direkt!

---------------------------------------------------------------------------------------------------

Wenn man Dinge im Data View editiert, aber die 3d Ansicht sich nicht aktualisiert hilft folgender Python Command:
App.getDocument("drawerhandle2").recompute()

oder

App.ActiveDocument.recompute()

---------------------------------------------------------------------------------------------------

shortcuts:
shift + left arrow key   |   rotate view 90° left
shift + right arrow key   |   rotate view 90° right

https://wiki.freecadweb.org/Sandbox:Keyboard_Shortcuts

---------------------------------------------------------------------------------------------------

Objekt drehen:
Draft Workbench auswählen
Objekt in der "Model"-Ansicht auswählen.
Jetzt die "current working plane" auswählen. (oben mittig in der Toolleiste)
(Hier muss man die Achse auswählen, um die man das Objekt drehen will)
"Rotate" Werkzeug anklicken
Dann irgendwo in der Zeichenebene in der Nähe des Objekts hinklicken.
Jetzt einen zweiten Punkt in der Zeichenebene setzen, am besten nicht zu weit entfernt vom ersten Punkt.
Jetzt den Cursor bewegen und das Objekt rotiert um die ausgewählte Achse.
Shift gedrückt halten, damit es einrastet, z.B. bei 90° oder 180°.

funktioniert aber irgendwie nicht so zuverlässig, wird oft schief

besser geht es mit diesem Python Command:
Draft.rotate([FreeCAD.ActiveDocument.Pad],90.0,FreeCAD.Vector(0,0,0),axis=FreeCAD.Vector(0,-1,0),copy=False)

Die 90.0 sind hier die Grad Drehung.
In der Klammer von axis=FreeCAD.Vector() steht die Achse drin, um die es sich drehen soll. (hier scheinbar die Y-Achse in negativer Richtung)

Noch einfacher geht es über das "Data" Register im linken Menü.
Hier kann unter "Placement" -> "Angle" und "Axis" die Drehung eingestellt werden.
Hier kann man auch die Pfeile am Ende der Textbox drücken und gedrückt halten um zu sehen, wie sich das Objekt dreht.
(funktioniert scheinbar nur bei Imports oder ganzen Bodies/Parts)

---------------------------------------------------------------------------------------------------

Objekt bewegen:
Habe das Objekt bewegt mit Draft -> Move, aber es hat nicht funktioniert und die Rotation wurde zurückgesetzt.

This command works:
Draft.move([FreeCAD.ActiveDocument.Pad],FreeCAD.Vector(0,10,0),copy=False)
(this example moves 10mm in y direction)

But it doesn't work if you have multiple pads in a document.
You have to use FreeCAD.ActiveDocument.nameofthepad or FreeCAD.ActiveDocument.nameoftheimport
(IMPORTANT YOU CAN'T USE SELF CHOSEN PAD NAMES, YOU HAVE TO USE PAD002 for example, the names the program gives you)

Wenn kommt "Draft is not defined", muss man erst
"import Draft" eingeben.

Noch einfacher geht es im "Data" Register im linken Menü.
Unter "Placement" -> "Position".
Hier kann man mit den Pfeiltasten am Ende der Textbox in Echtzeit bewegen.
(funktioniert scheinbar nur bei Imports oder ganzen Bodies/Parts)

---------------------------------------------------------------------------------------------------

Fehlermeldung beim Padden:
"Pad: Result has multiple solids"

=> Ein Pad muss immer an die vorhergehenden Pads angeschlossen sein und darf nicht in der Luft hängen.
Es muss ein zusammenhängendes Objekt geschaffen werden.

---------------------------------------------------------------------------------------------------

#### shapestrings

https://wiki.freecad.org/Draft_ShapeString_tutorial

Draft -> ShapeString

type in a string, select a height\
use a font like\
"/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf" \
hit "reset point" \
hit "ok"

Extrudion:\
To extrude you might have to pull the shapestring to "body" to add it to the active body.

Engravings:\
Make sure the shapestring is inside the active body. (otherwise pull it in)\
In the tree view select the shapestring and position it through the "placement" values \
so that it lies right on top of the face you want to do the engraving.\
Click "pocket", select a "length" that is smaller than the extruded object you are on.\
Click on the 3d view to update the view. Then hit "ok".

When pocketing shapestrings does not work:\
Den Shapestring mit Part -> Extrude aufpolstern. (so groß, dass er das komplette vorige Objekt durchlöchert)
Dann den extrudierten Shapestring in das Objekt positionieren. (Über das Register Data -> Position)
Jetzt erst das vorige Gesamtobjekt auswählen, dann mit strg + Klick das Extrudierte Objekt auswählen.
Dann Part -> Cut.
VORSICHT: DANACH WAR DAS PROJEKT NICHT MEHR WIE GEWOHNT BEARBEITBAR!!!
Daher wahrscheinlich nur als allerletzten Schritt denkbar.

---------------------------------------------------------------------------------------------------

Shapestrings pocketen

Manchmal funktioniert hier ein "Through all" nicht, da man dann wohl durch den allerersten Sketch des Grundkörpers geht.
Dann darf man nicht komplett durchfräsen, sondern z.B. bei einem 5mm "dicken" Körper nur 4mm reinfräsen.

---------------------------------------------------------------------------------------------------

Kegel/cones

Man kann zwar mit Part -> Cone einen Kegel erzeugen, den kann man aber nicht bearbeiten, da er nicht Part of the active Body ist.
Besser: Einen Sketch erzeugen, der nur rechts oder links der Y-Achse existiert.
Dann "revolve around a selected sketch", dann sollte man direkt einen Cone sehen bei 360°.
Denn er hat wohl standardmäßig revolve around the Y-axis ausgewählt.
Man kann aber auch andere Achsen (wahrscheinlich auch selbst erzeugte) verwenden.

---------------------------------------------------------------------------------------------------

Konische Zahnräder

Zwei Zahnräder mit unterschiedlicher Modulgröße erzeugen.
Dann ein Zahnrad in unterschiedlicher Z-Position positionieren.
Ein Zahnrad auswählen.
Nun in "Part Design" -> "Loft a selected profile through other profile sections" auswählen.
Auf "Add Section" klicken.
Auf den Reiter "Model" klicken.
Jetzt auf das zweite Gear klicken. (kurz warten, kann 2-3 Sekunden dauern)
Nun wird das konische Zahnrad erzeugt.
Jetzt nochmal auf den Reiter "Tasks" und mit "Ok" bestätigen.

---

#### arrays of body parts

In "part design" select your body part.\
And click "create a linear pattern feature".\
You might need to change the axis.\
Then you can select how many times you want your part to be multiplied\
and in which maximum length the array expands.

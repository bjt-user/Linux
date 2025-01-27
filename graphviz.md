#### documentation

https://graphviz.org

examples: https://graphviz.org/gallery/

#### syntax and tutorials

Really high learning curve, no good tutorials available.

#### installation

```
sudo pacman -S graphviz
```

## usage

#### gvedit

```
gvedit
```

Hit Button "New"

```
digraph {
A -> {B C}
foo -> bar
}
```

`F5` to render

#### dot

```
dot -Tsvg firsttry.gv > output.svg
```

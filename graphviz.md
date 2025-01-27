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

If you have `feh` installed:
```
dot -Tsvg firsttry.gv | feh -
```

```
dot -Tsvg firsttry.gv > output.svg
```

## syntax

#### clusters (`subgraph cluster_`)

Subgraphs that start with `cluster_` can build a group around nodes.\
Those nodes are then surrounded by a rectangle.
```
digraph {
        subgraph cluster_group_1 {
                label="Group 1";
                "Item 1";
                "Item 2";
        }
}
```

#### cluster colors

Use `color` and `bgcolor` to add color to a cluster:
```
subgraph cluster_group_1 {
        label="Group 1";
        color="red";
        bgcolor="grey";
        "Item 1";
        "Item 2";
}
```

#### node size

```
"Item 1" [width=5] [height=2];
```

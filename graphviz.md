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

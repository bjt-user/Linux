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

#### arrows positions

https://graphviz.gitlab.io/docs/attr-types/portPos/

You can use `n`, `e`, `s`, `w` for north, east, south, west.\
`ne` is also possible.

Just append it after a colon after your node:
```
node1:e -> node2:n
```

#### records

This will create two record nodes with two fields each:
```
node [shape=record]

pointer1 [label="<f0>my_number|<f1>0x00004400"]
pointer2 [label="<f0>my_string|<f1>0x0c887700"]
```

You can point from and to other nodes by accessing the fields as "ports":
```
pointer1:f1 -> pointer2:f0:e
```
(you can still add a compass like `portPos` as above "east")

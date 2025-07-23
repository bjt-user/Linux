## general info

WARNING: There are two popular tools named `yq`.

Python: (extra/yq):\
https://github.com/kislyuk/yq

Go: (extra/go-yq)\
https://github.com/mikefarah/yq

## go-yq vs. yq

`yq` (kislyuk) doesnt print uncommented yaml list elements \
which seems nicer.

## usage

#### convert json to yaml

yq (kislyuk):
```
yq -y . example.json
```

go-yq:
```
yq . -o yaml example.json
```

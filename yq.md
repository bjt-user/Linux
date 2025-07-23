## general info

WARNING: There are two popular tools named `yq`.

Python: (extra/yq):\
https://github.com/kislyuk/yq

Go: (extra/go-yq)\
https://github.com/mikefarah/yq

## go-yq vs. yq

`yq` (kislyuk) doesnt print uncommented yaml list elements \
because `yq` seems to convert to `json` by default.

But you can experiment with `-o` in `go-yq` to achieve a similar result:
```
$ yq .items[] list.yaml -o json
"foo"
"foobar"
```

```
$ yq .items[] list.yaml -o toml
foo
foobar
```

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

#### convert yaml to shell assignments (go-yq)

Given this yaml file:
```
$ cat var_list.yaml
tomcat:
  install_dir: "/opt/tomcat"
  user: "tomcat"
  group: "tomcat"
```

You can convert it to shell like this:
```
$ yq . var_list.yaml -o shell
tomcat_install_dir='/opt/tomcat'
tomcat_user=tomcat
tomcat_group=tomcat
```

Or when you go into the `tomcat` element:
```
$ yq .tomcat var_list.yaml -o shell
install_dir='/opt/tomcat'
user=tomcat
group=tomcat
```
It will not print the `tomcat_` prefix.

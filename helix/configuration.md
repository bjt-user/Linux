## config files

#### main config file

`${HOME}/.config/helix/config.toml`

You can configure the `theme` here:
```
theme = "everforest_dark"
```

#### languages.toml

https://docs.helix-editor.com/languages.html

You can configure the ansible language server like this:
```
~/.config/helix $ cat languages.toml
[language-server.ansible]
command = "ansible-language-server"

[[language]]
name = "ansible"
language-servers = ["ansible"]
scope = "source.ansible"
file-types = ["ansible"]
```

BUT this will only work if `ansible-lint` is installed...

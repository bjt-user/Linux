## usage

#### no warnings

```
yamllint --no-warnings .
```

#### using the "relaxed" configuration

Use "relaxed", but be strict (`-s`) and return exit code greater than 0 \
if there are warnings.
```
yamllint -d relaxed -s invalid.yaml
```
See https://yamllint.readthedocs.io/en/stable/configuration.html

#### custom configuration without a config file

https://yamllint.readthedocs.io/en/stable/configuration.html#custom-configuration-without-a-config-file

```
yamllint -d '{extends: default, rules: {document-start: disable}}' invalid.yaml
```

Do not forget the `extends`! Otherwise `yamllint` behaves unexpected.\
Probably all options will then be disabled.

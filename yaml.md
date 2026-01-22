#### multiline strings

This worked in a `.gitlab-ci.yml`:
```
script:
    >
      ansible all --private-key ~/.ssh/id_ed25519_ansible
      -i "${DEPLOY_TARGET}," -m ansible.builtin.ping
```
But you cannot place two `>` after each other like a list.

But for list items you seem to be able to just break the line \
and start at the indentation level of the item:
```
strings:
  - foo
    and more foo
  - bar
    and more bar
```
